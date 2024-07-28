import 'dart:convert';

import 'package:buburger/models/Cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';
import '../config/config.dart';

class CartServices {
  // function untuk request data ke API (endppoint : product-list)
  static Future<List<CartModel> > getCartList() async {

    // siapkan variabel untuk mengambil data id_user yg telah tersimpan saat login
    var userId = SpUtil.getInt('id_user');

    // siapkan variabel utk menyimpan list product
    List<CartModel> listCart = [];

    try {
      // buat variabel untuk request web service
      var response = await http.get( Uri.parse(Config().urlKeranjangList + userId.toString()) );

      // jika statuscode == 200  (success)
      if(response.statusCode == 200) {
        // ambil isi body dr output json (postman)
        var responseBody = json.decode(response.body);

        // buat variabel utk menampung isi dari response body
        List listAllProductResponse = responseBody["data"];

        // isian variabel listCart dengan isi dari listAllProductResponse
        listAllProductResponse.forEach((data) { 
          listCart.add(CartModel.fromJson(data));
         });

      } else {
        listCart = [];
      }

    } catch (e) {
      print(e);
    }
    return listCart;
  }
}
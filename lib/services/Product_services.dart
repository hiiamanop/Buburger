import 'dart:convert';

import 'package:buburger/config/config.dart';
import 'package:buburger/models/Product_model.dart';
import 'package:http/http.dart' as http;

class ProductSevices {
  // functio untuk request data ke API (endpoint: product - list )
  static Future<List<ProductModel>> getProductList() async{
    // siapkan varible untuk menyimpan list product
    List<ProductModel> listProduct = [];

    try {
      // buat variable untuk request web service
      var response = await http.get(Uri.parse(Config().urlProductAll));

      // jika status code = 200 (success)
      if (response.statusCode == 200) {
        // ambil isi body dari output json (posstman)
        var responseBody = json.decode(response.body);

        // buat cacribale untuk menampung isi dari response body
        List listAllProductResponse = responseBody["data"];

        // isian variable listProduct dengan isii dari listAllProductReseponse
        listAllProductResponse.forEach((data) {
          listProduct.add(ProductModel.fromJson(data));
        });
      } else {
        listProduct = [];
      }
    } catch (e) {
      print(e);
    }

    return listProduct;
  }
}
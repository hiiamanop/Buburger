import 'package:buburger/config/config.dart';
import 'package:buburger/models/Product_model.dart';
import 'package:buburger/pages/app/productDetailPage.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
      {super.key,
      required this.dataProduct,
      });

  // buat variabel untuk menerima data
  final ProductModel dataProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => ProductDetail(
                      dataProduct: dataProduct,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                dataProduct.gambar,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                dataProduct.namaProduct,
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ), 
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(Config.convertToIDR(int.parse(dataProduct.harga),0) ,style: greyTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}

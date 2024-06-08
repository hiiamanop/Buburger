import 'package:buburger/pages/app/productDetailPage.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
      {super.key,
      required this.nama,
      required this.imageUrl,
      required this.harga});

  // buat variabel untuk menerima data
  String nama, imageUrl, harga;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => ProductDetail(
                      nama: nama,
                      imageUrl: imageUrl,
                      harga: harga,
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
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                nama,
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(harga, style: greyTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}

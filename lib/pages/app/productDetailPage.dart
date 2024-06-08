import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail(
      {super.key,
      required this.nama,
      required this.imageUrl,
      required this.harga});

  String nama, imageUrl, harga;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Detail Burger",
          style: blackTextStyle,
        ),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Image.asset(
              widget.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama,
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.harga,
                      style: greyTextStyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/ic-kurang.png",
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("1"),
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/ic-tambah.png",
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ],
            ),
            // Detail
            SizedBox(
              height: 20,
            ),
            Text(
              "Detail",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Burger daging yang rendah lemak, dilengkapi dengan keju,seledri, dan potongan bawang bombai yang lezat.",
              style: greyTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            // Komposisi
            SizedBox(
              height: 20,
            ),
            Text(
              "Komposisi",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Roti, seledri, wijen, bawang bombai, daging sapi, keju..",
              style: greyTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      // BottomNavigation
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // keranjang
            Container(
              width: 150,
              height: 42,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                onPressed: null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 19,
                    right: 19,
                  ),
                  child: Text(
                    "+ Keranjang",
                    style: blackTextStyle,
                  ),
                ),
              ),
            ),

            // Pesan Sekarang
            Container(
              width: 150,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: redColor, width: 2),
              ),
              child: Center(
                  child: Text(
                "Pesan Sekarang",
                style: secondaryTextStyle,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

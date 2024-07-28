import 'package:buburger/config/config.dart';
import 'package:buburger/models/Product_model.dart';
import 'package:buburger/pages/app/pesanSekarangPage.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.dataProduct});

  final ProductModel dataProduct;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override

  // variabel jumlah
  int jumlah = 1;

  // fungsi menambah
  void increment() {
    setState(() {
      jumlah++;
    });
  }

  // fungsi mengurang
  void decrement() {
    setState(() {
      if (jumlah > 1) {
        jumlah--;
      }
    });
  }

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
            Image.network(
              widget.dataProduct.gambar,
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
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          widget.dataProduct.namaProduct,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    Text(
                      Config.convertToIDR(int.parse(widget.dataProduct.harga), 0),
                      style: greyTextStyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        decrement();
                      },
                      child: Image.asset(
                        "assets/ic-kurang.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(jumlah.toString()),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        increment();
                      },
                      child: Image.asset(
                        "assets/ic-tambah.png",
                        width: 24,
                        height: 24,
                      ),
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

            HtmlWidget(widget.dataProduct.spesifikasi),

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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PesanSekarangPage(
                            nama: widget.dataProduct.namaProduct,
                            imageUrl: widget.dataProduct.gambar,
                            harga: widget.dataProduct.harga,
                            qty: jumlah.toString())));
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}

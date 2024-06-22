import 'package:buburger/themes/themes.dart';
import 'package:buburger/widgets/cartWidget.dart';
import 'package:flutter/material.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 39,
        ),
        child: ListView(
          children: [
            Text(
              "Keranjang",
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),

            // widget cart
            CartWidget(
              nama: "Beef Burger",
              harga: "20.000",
              imageUrl: "assets/burger1.png",
              qty: "1",
            ),
            CartWidget(
              nama: "Onion Burger",
              harga: "23.000",
              imageUrl: "assets/burger3.png",
              qty: "1",
            ),
            CartWidget(
              nama: "Steak Burger",
              harga: "20.000",
              imageUrl: "assets/burger2.png",
              qty: "1",
            ),
          ],
        ),
      ),
    );
  }
}
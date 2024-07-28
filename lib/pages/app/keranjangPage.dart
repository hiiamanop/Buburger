import 'package:buburger/models/Cart_model.dart';
import 'package:buburger/services/Cart_Services.dart';
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
             FutureBuilder<List<CartModel>>(
              future: CartServices.getCartList(),
              builder: (context, snapshot) {

                // saat loading...
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // tampilkan widget CircularProgressIndicator
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    children: [
                       ...snapshot.data!.map((data) { 
                          return CartWidget(dataCart: data,);
                        })
                    ],
                  );
                }

                // defautl agar future builder bisa berfungsi
                return Container();
              },

              ),
          ],
        ),
      ),
    );
  }
}
import 'package:buburger/themes/themes.dart';
import 'package:buburger/widgets/orderWidget.dart';
import 'package:flutter/material.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            Text("Riwayat Pesanan", style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ), ),
            SizedBox(height: 15,),
            
            //panggil order widgets
            OrderWidget(
              nama: "Beef Burger",
              imageUrl: "assets/burger1.png",
              harga: "IDR 20.000",
              qty: "1",
              status: "Diproses",
            ),

             OrderWidget(
              nama: "Regular Burger",
              imageUrl: "assets/burger2.png",
              harga: "IDR 15.000",
              qty: "1",
              status: "Selesai",
            ),
          ],
        ),
      ),
    );
  }
}
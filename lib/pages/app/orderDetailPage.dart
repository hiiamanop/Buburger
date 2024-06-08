import 'package:buburger/themes/themes.dart';
import 'package:buburger/widgets/orderWidget.dart';
import 'package:buburger/widgets/statusWidget.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  OrderDetailPage({super.key, required this.nama, required this.harga, required this.imageUrl, required this.qty, required this.status });

  String nama, harga, imageUrl, qty, status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: blackColor, ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Lacak Pesanan",
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 37),
        child: ListView(
          children: [
            OrderWidget(nama: nama, harga: harga, imageUrl: imageUrl, qty: qty, status: status),
            SizedBox(height: 10,),

            // status widget
            StatusWidget(
              status: status,
            ),
          ],
        ),
      ),
    );
  }
}
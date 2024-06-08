import 'package:buburger/pages/app/orderDetailPage.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  OrderWidget({super.key, required this.nama, required this.harga, required this.imageUrl, required this.qty, required this.status });

  String nama, harga, imageUrl, qty, status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailPage(
          nama: nama,
          harga: harga,
          imageUrl: imageUrl,
          qty: qty,
          status: status,
        ) ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // image
            Image.asset(imageUrl, width: 105, height: 105, ),
            SizedBox(width: 21,),
            // column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ), ),
                Text(harga, style: greyTextStyle, ),
                Text("Qty : ${qty}", style: greyTextStyle, ),
                Text(status, style: status == "Diproses" ?  primaryTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ) : greenTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ) , ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  StatusWidget({super.key, required this.status});

  String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: whiteColor),
      child: Container(
        margin: EdgeInsets.only(top: 11, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status",
              style: blackTextStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    status == "Diproses"
                        ? Image.asset("assets/Ellipse2.png")
                        : Image.asset("assets/Ellipse1.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pesanan Diterima",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      "10.00",
                      style: greyTextStyle,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Image.asset(
                    "assets/Line1.png",
                    height: 20,
                  ),
                ),
                Row(
                  children: [
                    status == "Selesai"
                        ? Image.asset("assets/Ellipse2.png")
                        : Image.asset("assets/Ellipse1.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Pesanan Selesai",
                      style: greyTextStyle,
                    ),
                    Spacer(),
                    Text(
                      "10.30",
                      style: greyTextStyle,
                    ),
                  ],
                ),
                Divider(
                  thickness: 5,
                  color: primaryColor,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

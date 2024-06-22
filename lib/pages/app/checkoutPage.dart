import 'package:buburger/config/config.dart';
import 'package:buburger/pages/app/berandaPage.dart';
import 'package:buburger/pages/app/prosesPage.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage(
      {super.key,
      required this.namaLengkap,
      required this.nohp,
      required this.alamat,
      required this.metodePembayaran,
      required this.nama,
      required this.harga,
      required this.qty,
      required this.imageUrl});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();

  //deklarasikan nama variable yang akan dipakai

  // penerima
  final String namaLengkap, nohp, alamat, metodePembayaran;

  // variable penerima data detail burger
  final String nama, harga, qty, imageUrl;
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    // hitungan
    int totalHarga = int.parse(widget.harga) * int.parse(widget.qty);
    int ongkir = 10000;
    int totalBiaya = totalHarga + ongkir;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          "Pesan Burger",
          style: blackTextStyle,
        ),
        centerTitle: true,
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
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: Row(
              children: [
                Image.asset(
                  widget.imageUrl,
                  width: 105,
                  height: 105,
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.nama,
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      Config.convertToIDR(int.parse(widget.harga), 0),
                      style: greyTextStyle,
                    ),
                    Text(
                      "Qtf: ${widget.qty}",
                      style: greyTextStyle,
                    ),
                    Text(
                      "Total Harga:" +
                          Config.convertToIDR(
                              int.parse(totalBiaya.toString()), 0),
                      style: greyTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // detail pemesanan
          Container(
            decoration: BoxDecoration(color: whiteColor),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Pemesanan',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text('Nama Lengkap',
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.nama,
                    style: greyTextStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text('Nomor Telephone',
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.nohp,
                    style: greyTextStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text('Alamat',
                      style:
                          blackTextStyle.copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.alamat,
                    style: greyTextStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),

          // metode bayar
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            color: whiteColor,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    'Metode Pembayaran',
                    style: greyTextStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(widget.metodePembayaran,
                      style:
                          greyTextStyle.copyWith(fontWeight: FontWeight.w600))
                ],
              ),
            ),
          ),

          // rincian biaya
          Container(
            width: double.infinity,
            color: whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Biaya"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.nama,
                        style: greyTextStyle,
                      ),
                      Text(
                        Config.convertToIDR(int.parse(totalHarga.toString()),0),
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ongkos Kirim",
                        style: greyTextStyle,
                      ),
                      Text(
                        Config.convertToIDR(int.parse(ongkir.toString()),0),
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: greyTextStyle,
                      ),
                      Text(
                        totalBiaya.toString(),
                        style: secondaryTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '*Pastikan semua data sesuai sebelum melakukan pemesanan',
              style: greyTextStyle,
            ),
          ))
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: whiteColor,
        child: Container(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProsesPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 19,
                  right: 19,
                ),
                child: Text(
                  "Konfirmasi",
                  style: blackTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

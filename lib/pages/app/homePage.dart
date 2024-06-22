import 'package:buburger/pages/app/berandaPage.dart';
import 'package:buburger/pages/app/keranjangPage.dart';
import 'package:buburger/pages/app/pesananPage.dart';
import 'package:buburger/pages/app/profilePage.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // siapkan variabel untuk nilai awal tab bottom navigation barnya
  int selectedIndex = 0;

  // variabel screen/page apa saja yg akan dipakai
  static List<Widget> screenList = [
    BerandaPage(), //0
    KeranjangPage(), //1
    PesananPage(), //2
    ProfilePage() //3
  ];

  // buat fungsi tap.nya
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Pesanan"
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil"
          ),

        ],

        // atribut konfigurasi bottomnavigationbarnya
        currentIndex: selectedIndex,
        selectedItemColor: secondaryColor,
        unselectedItemColor: blackColor,
        onTap: onItemTapped,
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
      ),

      body: screenList.elementAt(selectedIndex),
    );
  }
}
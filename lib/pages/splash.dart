import 'dart:async';
import 'package:buburger/pages/auth/login.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  "assets/image1.png",
                  width: 35,
                ),
                const SizedBox(
                  width: 9,
                ),
                Text(
                  "Buburger",
                  style: splashTextStyle1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jagonya",
                      style: splashTextStyle2.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Burger!",
                      style: splashTextStyle2.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          
          Image.asset(
            "assets/img-splash.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
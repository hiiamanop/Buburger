import 'package:buburger/controllers/auth_controller.dart';
import 'package:buburger/pages/auth/login.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final authC = Get.put(AuthController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),

              // Login titile
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daftar",
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Daftar dengan Email dan Nomor Telefon",
                        style: greyTextStyle.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),

              // insert name, email and password
              Column(
                children: [
                  Row(
                    children: [
                      Text("Nama",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: authC.name,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "Masukan Nama",
                        hintStyle: greyTextStyle),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Email",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: authC.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "Masukan Email",
                        hintStyle: greyTextStyle),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // password input
                  Row(
                    children: [
                      Text("Password",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: authC.password,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: null, icon: Icon(Icons.visibility)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "Masukan Password",
                        hintStyle: greyTextStyle),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // password input
                  Row(
                    children: [
                      Text("Nomor Telefon",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    controller: authC.telepon,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "Masukan Nomor Telefon",
                        hintStyle: greyTextStyle),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  // button login
                  Container(
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () {
                          authC.register();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Daftar',
                              style: blackTextStyle,
                            ),
                          ],
                        )),
                  ),

                  SizedBox(
                    height: 27,
                  ),

                  // sudah punya akun? masuk disini
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah Punya Akun? ",
                        style: blackTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          "Masuk disini",
                          style: secondaryTextStyle.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

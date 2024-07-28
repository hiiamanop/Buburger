import 'package:buburger/controllers/auth_controller.dart';
import 'package:buburger/pages/auth/register.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    // buat variable untuk memanggil auth_contorller yang sudah dibuat
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
                        "Masuk",
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Masuk dengan akun yang telah terdaftar",
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

              // insert email and password
              Column(
                children: [
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
                    obscureText: true,
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
                    height: 7,
                  ),

                  // lupa password?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lupa Password",
                        style: redTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: redColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 60,
                  ),

                  // button login
                  Container(
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () {
                          authC.login();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Masuk',
                              style: blackTextStyle,
                            ),
                          ],
                        )),
                  ),

                  SizedBox(
                    height: 207,
                  ),

                  // belum punya akun? daftar sekarang!
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum Punya Akun? ",
                        style: blackTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          "Daftar sekarang!",
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

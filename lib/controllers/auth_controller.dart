import 'dart:convert';

import 'package:buburger/config/config.dart';
import 'package:buburger/pages/app/homePage.dart';
import 'package:buburger/pages/splash.dart';
import 'package:buburger/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  // siapkan variable inputan untuk login/register
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController(
      text: SpUtil.getString("email") == "" ? "" : SpUtil.getString("email"));
  TextEditingController password = TextEditingController(
      text: SpUtil.getString("password") == ""
          ? ""
          : SpUtil.getString("password"));
  TextEditingController telepon = TextEditingController();

  // function login
  Future login() async {
    // varible untuk menampung url endpoint fungsi login
    var url = Uri.parse(Config().urlLogin);

    // buat proses
    try {
      // fungsi untuk mengirim dara ke web service
      final response = await http
          .post(url, body: {'email': email.text, 'password': password.text});

      SpUtil.putString("email", email.text);
      SpUtil.putString("password", password.text);
      // print hasil dari variable response di atas
      print(response.body);

      // agar isi dari response body bisa dipakai, maka hrus di decode terlebih dahulu
      var responseDecode = json.decode(response.body);

      // handle error validation
      // map<string, dynamic> errorValidation = resonseDecode["data"];

      // ambil status code

      // jika status == 200 (berhasil)
      if (response.statusCode == 200) {
        // ambil data dari response yang didapatkan dari web service dan simpan di memorri HP
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon_user", responseDecode["data"]["telepon"]);

        // arahkan ke halaman homepage
        Get.offAll(HomePage());
      } else {
        // get.snackbar("Error: " + responseDecode["message"] == "Error Validation" ? errorValidation.toString() : responseDecode["message"]);

        Get.snackbar("Error", responseDecode["message"],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }

  // feature register
  Future register() async {
    // variable untuk menampung url endpoint fungsi login
    var url = Uri.parse(Config().urlRegister);

    // buat prosesnya
    try {
      // fungsi untuk mengirimkan data ke web service
      final response = await http.post(url, body: {
        'name': name.text,
        'email': email.text,
        'password': password.text,
        'telepon': telepon.text,
      });

      SpUtil.putString("email", email.text);
      SpUtil.putString("password", password.text);
      // print hasil dari varibale response di atas
      print(response.body);

      // ahar isi dari response body bisa dipakai, maka harus di decode terlebih dahulu
      var responseDecode = json.decode(response.body);

      // handle error validation
      Map<String, dynamic> errorValidation = responseDecode["data"];

      // ambil statuscode

      // jika statuscode == 2-- (berhasil)
      if (response.statusCode == 200) {
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon_user", responseDecode["data"]["telepon"]);

        // arahkan ke halaman homepage
        Get.offAll(HomePage());
      } else {
        Get.snackbar(
            "Error",
            responseDecode["message"] == "Error Validation"
                ? errorValidation.toString()
                : responseDecode["message"],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }

  // function logout

  Future logout() async {
    var url = Uri.parse(Config().urlLogout);

    try {
      final response = await http.get(url);
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {

        // hapus SpUtil yang tersimpan di HP
        // SpUtil.clear();

        // menghapus satu satu data yang disinpen SpUtil
        SpUtil.remove("id_user");
        SpUtil.remove("nama_user");
        SpUtil.remove("email_user");
        SpUtil.remove("telepon_user");
        
        // alert
        Get.snackbar("Success", responseDecode["message"],
            backgroundColor: greenColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));

        // kembali ke halaman splash
        Get.offAll(SplashPage());
      } else {
        Get.snackbar("Error", responseDecode['message'],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }
}

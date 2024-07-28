import 'package:buburger/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    final authC = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: Text(SpUtil.getString("email_user").toString()),
      ),
      body: Center(
        child: 
        InkWell(
          onTap: () {
            authC.logout();
          },
          child: Text('logout'),
        ),
      ),
    );
  }
}
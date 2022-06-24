import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDemo extends StatelessWidget {
  //const profileDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300)),
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () async {
          await SharedPreferences.getInstance().then((value) async {
            await value.setBool('user', false);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('mainscreen', (route) => false);
          });
        },
        child: Container(
            alignment: Alignment.center,
            height: 60,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            margin: const EdgeInsets.only(top: 80, left: 95),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.logout)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  //const MainScreen({Key? key}) : super(key: key);

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
          'Homepage',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await SharedPreferences.getInstance().then((value) async {
                if (value.containsKey('user') &&
                    value.getBool('user') == true) {
                      Navigator.of(context).pushNamed('Homepage');
                } else {
                  Navigator.of(context).pushNamed('signup');
                }
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
                child: const Icon(Icons.home_filled)),
          ),
          GestureDetector(
            onTap: () async {
              await SharedPreferences.getInstance().then((value) async {
                if (value.containsKey('user') &&
                    value.getBool('user') == true) {
                       Navigator.of(context).pushNamed('profiledemo');
                } else {
                  Navigator.of(context).pushNamed('signup');
                }
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
                margin: const EdgeInsets.only(top: 80, left: 60),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.account_box_sharp)),
          ),
        ],
      ),
    );
  }
}

import 'package:caravel1/AuthenticationLayer/profiledemo.dart';
import 'package:caravel1/College_details.dart';
import 'package:caravel1/AuthenticationLayer/Homepage.dart';
import 'package:caravel1/AuthenticationLayer/MainScreen.dart';
import 'package:caravel1/Profile.dart';
import 'package:caravel1/provider.dart';
import 'package:caravel1/AuthenticationLayer/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => provider())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({Key? key}) : super(key: key);
  var user = false;
  var load = false;

  Future checkuser() async {
    var inst = await SharedPreferences.getInstance();
    if (inst.containsKey('user') && inst.getBool('user') == true) {
      setState(() {
        user = true;
      });

    } else
    {
       setState(() {
        user = false;
      });
    }
     
  }

  @override
  void initState() {
    checkuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(user);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:MainScreen(),
      ),

      //CollegeDetail(),
      routes: {
        'profile': (context) => Profile(),
        'mainscreen': (ctx) => MainScreen(),
        'signup': (ctx) => Signup(),
        'Homepage':(ctx)=>const Homepage(),
        'profiledemo':(ctx)=> ProfileDemo()
      },
    );
  }
}

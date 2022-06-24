import 'package:caravel1/Const.dart';
import 'package:caravel1/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //const Signup({Key? key}) : super(key: key);
  var email = TextEditingController();
  var password = TextEditingController();
  var selected = 1;
  @override
  Widget build(BuildContext context) {
    //email.text = '';
    //password.text = '';
    var prov = Provider.of<provider>(context);
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
          'Signup',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (selected == 2) {
                        setState(() {
                          selected = 1;
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selected == 1
                            ? Colors.deepPurple.shade400
                            : Colors.grey.shade300,
                      ),
                      margin: const EdgeInsets.all(20),
                      width: 90,
                      child: Center(
                          child: Text(
                        'Signup',
                        style: TextStyle(
                          color: selected == 1 ? Colors.white : Colors.grey,
                          fontSize: 20,
                          //fontWeight: FontWeight.bold
                        ),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (selected == 1) {
                        setState(() {
                          selected = 2;
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selected == 2
                              ? Colors.deepPurple.shade400
                              : Colors.grey.shade300),
                      margin: const EdgeInsets.all(20),
                      width: 90,
                      child: Center(
                          child: Text(
                        'Signin',
                        style: TextStyle(
                          color: selected == 2 ? Colors.white : Colors.grey,
                          fontSize: 20,
                          //fontWeight: FontWeight.bold
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(25),
                child: TextFormField(
                    controller: email,
                    cursorColor: Colors.black,
                    decoration: textfdecoration.copyWith(labelText: 'Email')),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: TextFormField(
                    controller: password,
                    cursorColor: Colors.black,
                    decoration:
                        textfdecoration.copyWith(labelText: 'Password')),
              ),
              GestureDetector(
                onTap: () async {

                  if(email.text.trim()==''||password.text.trim()=='')
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('cannot be empty!')));
                  }
                  else
                  {
                      await SharedPreferences.getInstance().then((inst) async {
                    if (selected == 1) {
                      await inst.setString('email', email.text);
                      await inst.setBool('user', true);
                      await inst.setString('password', password.text).then(
                          (value) => Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                                  'mainscreen', (route) => false));
                    } else {
                      if (inst.containsKey("email")) {
                        if (inst.getString('email') == email.text &&
                            inst.getString('password') == password.text) {
                              await inst.setBool('user', true);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'mainscreen', (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid Credential!')));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Signup First!')));
                      }
                    }
                  });
                  }
                
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurple.shade400
                  ),
                  margin: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    selected == 1 ? 'Signup' : 'Signin',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      //fontWeight: FontWeight.bold
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

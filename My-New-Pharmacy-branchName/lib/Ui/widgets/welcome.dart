// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_import, unnecessary_import
// ignore: avoid_web_libraries_in_flutter
import 'dart:io';
import 'dart:ui';
import 'package:reminder/easy%20contact/contact_screen.dart';
import 'package:reminder/easy%20contact/addPharmacy_screen.dart';
import 'package:reminder/easy%20contact/addDoctor_screen.dart';
import 'package:reminder/Ui/widgets/signin_screen.dart';
import 'package:reminder/Ui/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:reminder/main.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 22,
                ),
                Positioned(
                  child: Image.asset(
                    "assets/images/logo1.png",
                    width: 200,
                  ),
                ),
                Text(
                  "My Pharmacy",
                  style: TextStyle(fontSize: 39, color: Colors.indigo[400]),
                ),
                Text(
                  "Your Medication Guide",
                  style: TextStyle(fontSize: 20, color: Colors.indigo[400]),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      width: 15,
                    ),
/*
 ElevatedButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 83, 36, 93)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 50, vertical: 30)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                  ),
                  child: Text(
                    "log in",
                    style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 237, 235, 234)),
                  ),
                ),
*/

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                      child: Text(
                        "Login ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color:
                              Colors.indigo[400], //.fromARGB(255, 83, 36, 93),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
/*
               ElevatedButton(
                  onPressed: () {
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 83, 36, 93)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 50, vertical: 30)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                  ),
                  child: Text(
                    "sign up",
                    style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 237, 235, 234)),
                  ),
                ),
*/

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Text(
                        "Sign up ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors
                              .indigo[400], //Color.fromARGB(255, 83, 36, 93),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.indigo[400]),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 55, vertical: 30)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                  ),
                  child: Text(
                    "Go To App",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, avoid_print, duplicate_import, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:reminder/easy%20contact/contact_screen.dart';
//import 'package:firebase_reg/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:reminder/Utils/color_utils.dart';
import 'package:reminder/main.dart';
import 'package:reminder/reusable_Widgets/reusable_widget.dart';
import 'package:reminder/Ui/widgets/signup_screen.dart';
import 'package:reminder/Utils/color_utils.dart';
import 'package:reminder/Ui/home_page.dart';

//import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _PasswordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("FFFFFF"),
          hexStringToColor("FFFFFF"), // 92A4D7
          hexStringToColor("FFFFFF"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(children: <Widget>[
            //logoWidget("assets/image/5.png"),
            SizedBox(
              height: 30,
            ),
            reusableTextField("Enter UserName", Icons.person_outline, false,
                _emailTextController),
            SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _PasswordTextController),
            SizedBox(
              height: 20,
            ),
            signInSignUpButton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _PasswordTextController.text)
                  .then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            }),
            signUpOption()
          ]),
        )),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?  ",
            style: TextStyle(color: Colors.indigo)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

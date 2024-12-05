// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, unused_element, must_be_immutable, file_names, camel_case_types
// ignore_for_file: unused_import, prefer_const_constructors
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

//import '../db/db_handler.dart';

import 'dart:convert';

class Pharmacy_page extends StatelessWidget {
  Pharmacy_page({super.key});
  //DataHelper dbHandler = DataHelper();

  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  /*
  Future<void> insserrecord() async {
    var uri = "http://192.168.3.13/contactinformation/contactpharmacy.php";
    var response = await http.post(Uri.parse(uri), body: {
      "name": name.text,
      "phoneNumber": phoneNumber.text,
      "city": city.text,
      "street": street.text
    });

    var data = jsonDecode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "This Pharmacy Already Exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.indigo.shade400,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "This Pharmacy Added Successfuly",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.indigo.shade400,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
*/
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
                    height: 20,
                  ),
                  Text(
                    "Add Pharmacy ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors
                            .indigo[400] // Color.fromARGB(255, 35, 71, 100),
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 234, 246),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: 266,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color(0xFF5C6BC0))),
                    ),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 234, 246),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: 266,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      controller: phoneNumber,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.indigo[400])),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 234, 246),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: 266,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: city,
                      decoration: InputDecoration(
                          hintText: "City",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.indigo[400])),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 232, 234, 246),
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: 266,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: street,
                      decoration: InputDecoration(
                          hintText: "Street",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.indigo[400])),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber
                          .shade300), //Color.fromARGB(255, 250, 199, 112)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo[400],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "cencel",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

// ignore_for_file: unused_import, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, unused_element, must_be_immutable, file_names, depend_on_referenced_packages, unnecessary_cast, unnecessary_this, override_on_non_overriding_member, camel_case_types, unnecessary_new, use_key_in_widget_constructors, prefer_final_fields
// ignore_for_file: unused_import, prefer_const_constructors
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//import 'package:reminder/models/doctor.dart';

//import '../db/data_base_handler.dart';

class Doctor_page extends StatefulWidget {
  @override
  Doctor_PageState createState() {
    return new Doctor_PageState();
  }
}

class Doctor_PageState extends State<Doctor_page> {
  // late Future<List<Doctor>> doctors;
  TextEditingController name = TextEditingController();
  TextEditingController medicalSpeciality = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  //DatabaseHandler dbHandler = DatabaseHandler();
  bool _validate = false;
  bool _validateMedical = false;
  bool _validatePhone = false;
  bool _validateCity = false;
  bool _validateStreet = false;

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
                    "Add Doctor ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors
                            .indigo[400] // Color.fromARGB(255, 35, 71, 100),
                        ),
                    //style: TextStyle(fontSize: 35, fontFamily: "myfont"),
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
                    // ignore: prefer_const_constructors
                    child: TextField(
                      controller: name,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.indigo[400]),
                          errorText:
                              _validate ? 'This Field Can not Be Empty' : null),
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
                      controller: medicalSpeciality,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          hintText: "Medical Speciaity",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.indigo[400]),
                          errorText: _validateMedical
                              ? 'This Field Can not Be Empty'
                              : null),
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
                      controller: phoneNumber,
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.indigo[400]),
                          errorText: _validatePhone
                              ? 'This Field Can not Be Empty'
                              : null),
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
                    // ignore: prefer_const_constructors
                    child: TextField(
                      controller: city,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          hintText: "City",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.indigo[400]),
                          errorText: _validateCity
                              ? 'This Field Can not Be Empty'
                              : null),
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
                          hintStyle: TextStyle(color: Colors.indigo[400]),
                          errorText: _validateStreet
                              ? 'This Field Can not Be Empty'
                              : null),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      /*
                      Doctor doctor = Doctor();
                      doctor.name = name.text.toString();
                      doctor.medicalSpeciality =
                          medicalSpeciality.text.toString();
                      doctor.phoneNumber = phoneNumber.text.toString();
                      doctor.city = city.text.toString();
                      doctor.street = street.text.toString();
                      */
                      //await DatabaseHandler.insert(doctor);
                      // initState();
                      //setState(() {});
                      setState(() {
                        name.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                        medicalSpeciality.text.isEmpty
                            ? _validateMedical = true
                            : _validateMedical = false;
                        phoneNumber.text.isEmpty
                            ? _validatePhone = true
                            : _validatePhone = false;
                        city.text.isEmpty
                            ? _validateCity = true
                            : _validateCity = false;
                        street.text.isEmpty
                            ? _validateStreet = true
                            : _validateStreet = false;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber
                          .shade300), //Color.fromARGB(255,250,199,112)), // Color.fromARGB(255, 228, 164, 27)),
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
                      backgroundColor: MaterialStateProperty.all(
                          Colors.white), //Color.fromARGB(255, 237, 235, 235)),
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

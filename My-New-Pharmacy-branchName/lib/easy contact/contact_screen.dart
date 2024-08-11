// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:reminder/easy contact/addDoctor_screen.dart';
import 'package:reminder/easy contact/addPharmacy_screen.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/person.png',
                  width: 70,
                ),
                SizedBox(
                  width: 130,
                ),
                Image.asset(
                  'assets/images/pharmacy.png',
                  width: 70,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Doctor_page()));
                  },
                  child: Text(
                    "Add Doctor ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors
                            .indigo[400] // Color.fromARGB(255, 35, 71, 100),
                        ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pharmacy_page()));
                  },
                  child: Text(
                    "Add Pharmacy ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors
                            .indigo[400] //Color.fromARGB(255, 35, 71, 100),
                        ),
                  ),
                ),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                    child: (Divider(
                        height: 30, thickness: 1, color: Colors.white))),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 350,
              child: TextField(
                onChanged: (value) {
                  //searchData(st = value.trim().toLowerCase());
                  // Method Fowr Searching
                },
                decoration: InputDecoration(
                  hintText: "Search ",
                  hintStyle: TextStyle(
                      fontSize: 25,
                      color:
                          Colors.indigo[400] //Color.fromARGB(255, 35, 71, 100),
                      ),
                  prefixIcon: Icon(Icons.search, color: Color(0xFF656DB4)),
                  filled: true,
                  fillColor: Colors.indigo[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

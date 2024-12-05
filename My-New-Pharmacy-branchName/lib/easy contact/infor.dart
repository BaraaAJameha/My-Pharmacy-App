// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unnecessary_import, unused_import

import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:reminder/main.dart';
import '../easy contact/search_screen.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo[400],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        },
        icon: const Icon(Icons.camera_alt),
        label: const Text(""),
      ),

      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/image of scan acartoon.png',
                    width: 200,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Please take an image for the medicine or type the Generic name of it on the text box",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(92, 107, 192, 1)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {
                      //searchData(st = value.trim().toLowerCase());
                      // Method For Searching
                    },
                    decoration: InputDecoration(
                      hintText: "Generic Name",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Color.fromARGB(255, 237, 235, 235),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 92, 107, 192)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: Text(
                          "Prescription",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 237, 235, 234)),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 92, 107, 192)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: Text(
                          "Alternatives",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 237, 235, 234)),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 92, 107, 192)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: Text(
                          "Contraindication",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 237, 235, 234)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
  /*
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/image of scan acartoon.png',
                    width: 200,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Please take an image for the medicine or type the Generic name of it on the text box",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(92, 107, 192, 1)),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    onChanged: (value) {
                      //searchData(st = value.trim().toLowerCase());
                      // Method For Searching
                    },
                    decoration: InputDecoration(
                      hintText: "Search ",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Color.fromARGB(255, 237, 235, 235),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 92, 107, 192)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: Text(
                          "Prescription",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 237, 235, 234)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 92, 107, 192)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: Text(
                          "Alternatives",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 237, 235, 234)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 92, 107, 192)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                        child: Text(
                          "Contraindication",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 237, 235, 234)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/

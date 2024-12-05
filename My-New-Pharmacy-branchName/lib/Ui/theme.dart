// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData(
      // ignore: deprecated_member_use
      backgroundColor: Colors.white,
      primaryColor: Color.fromARGB(255, 255, 255, 255),
      brightness: Brightness.light);

  static final dark = ThemeData(
      // ignore: deprecated_member_use
      backgroundColor: Color(0xFF121212),
      primaryColor: Color(0xFF121212),
      brightness: Brightness.dark);
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey));
}

TextStyle get HeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.black));
}
TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.white:Colors.black));
}
TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,
      color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]));
}
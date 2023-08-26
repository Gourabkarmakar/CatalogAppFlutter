import 'package:catalog_app/pallets/palates.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myAllThems {
  static ThemeData lightThemeData = ThemeData(
    // primarySwatch: Colors.green.shade300,
    primarySwatch: Palette.kToDark,
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 30.0,
            fontWeight: FontWeight.bold)),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static const backColor = Color.fromARGB(255, 239, 239, 239);
  static const backWhiteColor = Color.fromARGB(255, 255, 255, 255);
}

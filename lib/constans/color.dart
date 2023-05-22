import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const Color PrimaryColor = Color(0xFFff4b4b);
  static const Color SecondaryColr = Color(0xFFffca27);
  static const Color accentColor = Color(0xFF4169e8);

  static const Color whiteColor = Color(0xFFf5f5f5);
  static var customFontWhite = GoogleFonts.coiny(
    textStyle:
        TextStyle(fontSize: 28, letterSpacing: 3,color: whiteColor)
  );
}
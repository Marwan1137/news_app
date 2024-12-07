import 'package:flutter/material.dart';

class appTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color navy = Color(0xFF4F5A69);
  static const Color red = Color(0xFFC91C22);
  static const Color blue = Color(0xFF003E90);
  static const Color babyblue = Color(0xFF4882CF);
  static const Color yellowishBrown = Color(0xFFCF7E48);
  static const Color pink = Color(0xFFED1E79);
  static const Color yellow = Color(0xFFF2D352);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      centerTitle: true,
      titleTextStyle:
          TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      toolbarHeight: 100,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}

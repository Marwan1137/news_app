import 'package:flutter/material.dart';

/* -------------------------------------------------------------------------- */
/*                            App Theme Configuration                           */
/* -------------------------------------------------------------------------- */
// ignore: camel_case_types
class AppTheme {
  /* -------------------------------------------------------------------------- */
  /*                            Color Definitions                                 */
  /* -------------------------------------------------------------------------- */
  static const Color primary = Color(0xFF39A552);

  static const Color red = Color(0xFFC91C22);
  static const Color blue = Color(0xFF003E90);
  static const Color babyblue = Color(0xFF4882CF);
  static const Color navy = Color(0xFF42505C);
  static const Color grey = Color(0xFF79828B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color pink = Color(0xFFED1E79);
  static const Color yellowishbrown = Color(0xFFCF7E48);
  static const Color yellow = Color(0xFFF2D352);
  static const Color black = Color(0xFF060E1E);

  /* -------------------------------------------------------------------------- */
  /*                            Light Theme Configuration                         */
  /* -------------------------------------------------------------------------- */
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: white,
      ),
      color: primary,
      elevation: 0,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge:
          TextStyle(fontSize: 22, color: white, fontWeight: FontWeight.bold),
    ),
  );
}

import 'package:flutter/material.dart';

class MyThemeData {
  static const Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static const Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: colorBlack,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Color.fromRGBO(36, 36, 36, 1.0),
            fontSize: 35,
            fontWeight: FontWeight.w900),
        subtitle1: TextStyle(
            color: Color.fromRGBO(36, 36, 36, 1.0),
            fontSize: 25,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Color.fromRGBO(36, 36, 36, 1.0),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: MyThemeData.colorGold,
        selectedItemColor: MyThemeData.colorBlack,
        unselectedItemColor: Colors.white,
      ));

  //-------------------------------------------------------------------------

  static ThemeData DartTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
  );
}

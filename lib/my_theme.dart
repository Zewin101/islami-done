import 'package:flutter/material.dart';

class MyThemeData {
  static const Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static const Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static const Color colorDark = Color.fromRGBO(20, 26, 46, 1.0);
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
        headline3: TextStyle(
            color: Color.fromRGBO(134, 101, 3, 1.0),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1.0),
            fontSize: 100,
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
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Color.fromRGBO(178, 132, 1, 1.0),
            fontSize: 35,
            fontWeight: FontWeight.w900),
        subtitle1: TextStyle(
            color: Color.fromRGBO(214, 193, 164, 1.0),
            fontSize: 25,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            color: Color.fromRGBO(183, 147, 95, 1.0),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        headline3: TextStyle(
            color: Color.fromRGBO(20, 26, 46, 1.0),
            fontSize: 20,
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            color: Color.fromRGBO(245, 220, 148, 1.0),
            fontSize: 100,
            fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: MyThemeData.colorBlack,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ));
}

import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF522b72),
    primaryColorDark: const Color(0xFF210439),
    primaryColorLight: const Color(0xFF714c8f),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF5f5f5),
    fontFamily: 'Futura',
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      headline4: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      headline5: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      headline6: TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
      bodyText1: TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
      bodyText2: TextStyle(
          color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal),
    ),
  );
}

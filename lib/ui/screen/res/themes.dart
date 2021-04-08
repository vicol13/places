import 'package:flutter/material.dart';

///
/// light theme colors
/// 
const Color lt_blue = Color.fromRGBO(59, 62, 91, 1);
const Color lt_grey = Color.fromRGBO(245, 245, 245, 1);
const Color lt_grey_text = Color.fromRGBO(124, 126, 146, 0.56);
const Color lt_green = Color.fromRGBO(76, 175, 80, 1);

final brightTheme = ThemeData(
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    buttonColor: lt_green,
    cardColor: lt_grey,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: lt_grey_text),
      subtitle1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white, selectedItemColor: lt_blue),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: lt_grey_text,
      labelColor: Colors.white,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: lt_blue),
    ));

///
/// dark theme colors
/// 
const Color dt_blue = Color.fromRGBO(33, 34, 44, 1);
const Color dt_dark_blue = Color.fromRGBO(26, 26, 32, 1);
const Color dt_green = Color.fromRGBO(106, 218, 111, 1);

final darkTheme = ThemeData(
    backgroundColor: dt_blue,
    cardColor: dt_dark_blue,
    scaffoldBackgroundColor: dt_blue,
    buttonColor: dt_green,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: lt_grey_text),
      subtitle1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: dt_blue,
        selectedItemColor: dt_green,
        unselectedItemColor: Colors.grey
        ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: lt_grey_text,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: dt_green),
    ));

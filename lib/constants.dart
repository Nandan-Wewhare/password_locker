import 'package:flutter/material.dart';

var kDarkTheme = ThemeData.dark().copyWith(
  buttonTheme: const ButtonThemeData(buttonColor: Colors.deepOrange),
  primaryColor: const Color(0xff000000),
  cursorColor: Colors.deepOrange,
  buttonColor: Colors.deepOrange,
  scaffoldBackgroundColor: const Color(0xff141414),
  focusColor: Colors.deepOrange,
  indicatorColor: Colors.deepOrange,

  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.deepOrange), 
  ),
  iconTheme: const IconThemeData(
    color: Colors.deepOrange,
  ),
  appBarTheme: const AppBarTheme(
      color: Colors.deepOrange,
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Color(0xffffffff),
            fontSize: 22,
            fontWeight: FontWeight.w600),
      )),
accentColor:Colors.deepOrange,
);

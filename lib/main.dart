import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_locker/constants.dart';
import 'package:password_locker/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrange,
      ),
      darkTheme: kDarkTheme,
      home:WelcomeScreen() ,
    );
  }
}

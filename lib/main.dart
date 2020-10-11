import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_locker/constants.dart';
import 'package:password_locker/pref.dart';
import 'screens/pinput_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Status status = Status();
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
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data ? PinputScreen() : WelcomeScreen();
          } else if (snapshot.hasError) {
            return Center(child: Text('Please try again.'));
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.deepOrange,
            ),
          );
        },
        future: status.registeredStatus,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  accentColor: Colors.deepOrange,
);
const List<String> kQuestions = [
  '~~ Select a Security Question ~~',
  'What was your childhood nickname?',
  'What school did you attend for sixth grade?',
  'In what city does your nearest sibling live?',
  'What was your dream job as a child?',
  'What is your mother\'s middle name?'
];

const List<String> kSocial = [
  '~~ Select an account ~~',
  'Facebook',
  'Instagram',
  'Twitter',
  'LinkedIn',
  'Other'
];

const List <FaIcon> kIcons = [
  FaIcon(FontAwesomeIcons.facebookSquare),
  FaIcon(FontAwesomeIcons.instagramSquare),
  FaIcon(FontAwesomeIcons.twitterSquare),
  FaIcon(FontAwesomeIcons.linkedin),
  FaIcon(FontAwesomeIcons.user),
];

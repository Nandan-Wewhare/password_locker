import 'package:flutter/cupertino.dart';

class Info {
  String title;
  String password;
  Widget icon;
  Visibility visibility;
  Info({this.password, this.title, this.visibility = Visibility.OFF,this.icon});
}

enum Visibility { ON, OFF }
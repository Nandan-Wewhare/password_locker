class Info {
  String title;
  String password;
  Visibility visibility;
  Info({this.password, this.title, this.visibility = Visibility.OFF});
}

enum Visibility { ON, OFF }
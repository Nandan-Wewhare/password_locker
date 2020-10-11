import 'package:shared_preferences/shared_preferences.dart';

class Status {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  void setRegistered() async {
    SharedPreferences _pref = await pref;
    _pref.setBool("registered", true);
  }

  get registeredStatus async {
    SharedPreferences _pref = await pref;
    return _pref.getBool("registered")??false;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late final SharedPreferences prefs;
  static initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static loginSave() async {
    await prefs.setBool('UserLogined', true);
  }

  static Future<bool> checkLogin() async {
    bool? checkLogin = await prefs.getBool('UserLogined');
    if (checkLogin == true) {
      return true;
    } else {
      return false;
    }
  }

  static logoutSave() async {
    await prefs.setBool('UserLogined', false);
  }
}

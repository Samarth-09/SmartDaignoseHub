import 'package:shared_preferences/shared_preferences.dart';

class globalVariables {
  static String token = "";
  static void storeToken(t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", t);
    token = t;
  }

  static Future<void> setToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }
}

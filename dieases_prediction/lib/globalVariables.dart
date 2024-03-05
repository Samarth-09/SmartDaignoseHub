import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import './routes.dart';

class globalVariables {
  static String token = "";
  static Color light1 = const Color.fromARGB(255, 222, 226, 230),
      light2 = const Color.fromARGB(200, 222, 226, 230),
      light3 = const Color.fromARGB(255, 248, 249, 250),
      dark1 = const Color.fromARGB(255, 33, 37, 41),
      dark2 = const Color.fromARGB(255, 52, 58, 64);
  static void storeToken(t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", t);
    token = t;
  }

  static Future<void> setToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
  }

  static Future<int> chechTokenPresence(context) async {
    await globalVariables.setToken();
    if (globalVariables.token != "") {
      return 1;
    } else {
      return 0;
    }
  }
}

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

  static List<String> diabetesReportValueNames = [
    "Pregnancies",
    "Glucose",
    "BloodPressure",
    "SkinThickness",
    "Insulin",
    "BMI",
    "DiabetesCount",
    "Age"
  ];

  static List<String> heartDiseaseReportValueNames = [
    "Age",
    "Sex",
    "Chest Pain",
    "trestbps",
    "chol",
    "fbs",
    "restecg",
    "thalach",
    "exang",
    "oldpeak",
    "slope",
    "ca",
    "thal"
  ];

  static List<String> parkinsonReportValueNames = [
    "MDVP:Fo",
    "MDVP:Fhi",
    "MDVP:Flo",
    "MDVP:Jitter(%)",
    "MDVP:Jitter(Abs)",
    "MDVP:RAP",
    "MDVP:PPQ",
    "MDVP:DDP",
    "MDVP:Shimmer",
    "MDVP:Shimmer(dB)",
    "Shimmer:APQ3",
    "Shimmer:APQ5",
    "MDVP:APQ",
    "Shimmer:DDA",
    "NHR",
    "HNR",
    "RPDE",
    "DFA",
    "spread1",
    "spread2",
    "D2",
    "PPE"
  ];

  static List<String> parkinsonReportValue = [
    "119.992",
    "157.302",
    "74.997",
    "0.00784",
    "0.00007",
    "0.00370",
    "000554",
    "0.01109",
    "0.04374",
    "0.426",
    "0.02971",
    "0.06545",
    "0.02211",
    "21.033",
    "0.414783",
    "0.815285",
    "-4.813031",
    "0.266482",
    "2.301442",
    "0.284654",
    "1",
    "1",
    "1"
  ];
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

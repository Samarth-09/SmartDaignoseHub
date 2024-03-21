import 'package:dieases_prediction/screens/diabetes.dart';
import 'package:dieases_prediction/screens/diseaseDescreption.dart';
import 'package:dieases_prediction/screens/diseaseDetialDescription.dart';
import 'package:dieases_prediction/screens/heartDisease.dart';
import 'package:dieases_prediction/screens/login.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:dieases_prediction/screens/outcome.dart';
import 'package:dieases_prediction/screens/parkinson.dart';
import 'package:dieases_prediction/screens/selectDisease.dart';
import 'package:dieases_prediction/screens/signup.dart';
import 'package:dieases_prediction/screens/solution.dart';
import 'package:dieases_prediction/screens/userProfile.dart';
import 'package:dieases_prediction/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const welcome(),
        routes: {
          routes.login: (context) => const login(),
          routes.predictDiabetes: (context) => const diabetes(),
          routes.outcome: (context) =>
              outcome(diseaseName: "Diabetes", result: 0),
          routes.welcome: (context) => const welcome(),
          routes.selectDisease: (context) => const selectDisease(),
          routes.diseaseDescreption: (context) => const diseaseDescreption(),
          routes.solution: (context) => solution(disease: "Diabetes"),
          routes.userProfile: (context) => const userProfile(),
          routes.predictHeartDisease: (context) => const heartDisease(),
          routes.predictParkinson: (context) => const parkinson(),
          routes.detailDescription: (context) => diseaseDetailDescription(disease: "Diabetes"),
          routes.signup :(context) => const signup()
        });
  }
}

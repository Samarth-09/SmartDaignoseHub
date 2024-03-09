import 'package:dieases_prediction/commonWidgets.dart';
import 'package:dieases_prediction/cubits/heartDisease/heartDisease_cubit.dart';
import 'package:dieases_prediction/cubits/heartDisease/heartDisease_state.dart';
import 'package:flutter/material.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:dieases_prediction/screens/outcome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class heartDisease extends StatefulWidget {
  const heartDisease({super.key});

  @override
  State<heartDisease> createState() => _heartDiseaseState();
}

class _heartDiseaseState extends State<heartDisease> {
  List<TextEditingController> t = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            width: w,
            height: h,
            color: const Color.fromARGB(255, 52, 58, 64),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: (h / 100) * 3),
                        child: commonWidgets.myInputField(
                            w * 0.9, w, "Age", "25", t[0], null)),
                    commonWidgets.myInputField(
                        w * 0.9, w, "Sex", "Male", t[1], null),
                    SizedBox(
                        width: w * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonWidgets.myInputField(
                                w * 0.4, w, "CP", "110.586626", t[2], null),
                            commonWidgets.myInputField(
                                w * 0.4, w, "trestbps", "68.094985", t[3], null)
                          ],
                        )),
                    SizedBox(
                        width: w * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonWidgets.myInputField(
                                w * 0.4, w, "chol", "20.052432", t[4], null),
                            commonWidgets.myInputField(
                                w * 0.4, w, "fbs", "70.563830", t[5], null)
                          ],
                        )),
                    SizedBox(
                        width: w * 0.9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonWidgets.myInputField(w * 0.4, w, "restecg",
                                  "30.567477", t[6], null),
                              commonWidgets.myInputField(
                                  w * 0.4, w, "thalach", "0.434676", t[7], null)
                            ])),
                    SizedBox(
                        width: w * 0.9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonWidgets.myInputField(
                                  w * 0.4, w, "exang", "30.567477", t[8], null),
                              commonWidgets.myInputField(
                                  w * 0.4, w, "oldpeak", "0.434676", t[9], null)
                            ])),
                    SizedBox(
                        width: w * 0.9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              commonWidgets.myInputField(w * 0.4, w, "slope",
                                  "30.567477", t[10], null),
                              commonWidgets.myInputField(
                                  w * 0.4, w, "ca", "0.434676", t[11], null)
                            ])),
                    commonWidgets.myInputField(
                        w * 0.9, w, "thal", "31", t[12], null),
                    BlocProvider(
                      create: (context) => heartDiseaseCubit(),
                      child: BlocBuilder<heartDiseaseCubit, heartDiseaseState>(
                          builder: (context, state) {
                        if (state is heartDiseaseStateFilling) {
                          return InkWell(
                            onTap: () {
                              List<num> l = [];
                              for (var element in t) {
                                l.add(num.parse(element.text));
                                element.dispose();
                              }
                              context.read<heartDiseaseCubit>().submitted(l);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: (h/100)*3),
                              alignment: Alignment.center,
                              width: w * 0.9,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 206, 212, 218),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Submit",
                                style: GoogleFonts.getFont("Gowun Dodum")
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            255, 33, 37, 41),
                                        fontSize: (w / 100) * 8),
                              ),
                            ),
                          );
                        } else {
                          if (state is heartDiseaseStateSubmitted) {
                            getResult(state);
                          }
                          return Container(
                            margin: EdgeInsets.only(bottom: (h/100)*3),
                              padding: const EdgeInsets.all(10),
                              width: (w / 100) * 15,
                              height: (h / 100) * 6,
                              color: const Color.fromARGB(255, 33, 37, 41),
                              child: const CircularProgressIndicator(
                                  color: Color.fromARGB(255, 206, 212, 218)));
                        }
                      }),
                    )
                    //Pregnancies Glucose BloodPressure SkinThickness Insulin BMI DiabetesPedigreeFunction Age
                  ]),
            )));
  }

  void getResult(state) async {
    outcome.result = await state.ah.predictHeartDisease(state.l);
    outcome.dieasesName = "Heart Disease";
    await Navigator.popAndPushNamed(context, routes.outcome);
  }
}

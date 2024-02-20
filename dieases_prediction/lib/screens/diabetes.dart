import 'package:dieases_prediction/cubits/diabetes/diabetes_cubit.dart';
import 'package:dieases_prediction/cubits/diabetes/diabetes_state.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:dieases_prediction/screens/outcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dieases_prediction/widgets.dart';

class diabetes extends StatefulWidget {
  const diabetes({super.key});

  @override
  State<diabetes> createState() => _diabetesState();
}

class _diabetesState extends State<diabetes> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    List<TextEditingController> t = [];
    t.add(TextEditingController());
    t.add(TextEditingController());
    t.add(TextEditingController());
    t.add(TextEditingController());
    t.add(TextEditingController());
    t.add(TextEditingController());
    t.add(TextEditingController());
    t.add(TextEditingController());
    return Scaffold(
        body: Container(
            width: w,
            height: h,
            color: const Color.fromARGB(255, 52, 58, 64),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widgets.myInputField(
                      w * 0.9, w, "Pregnancies", "3.168693", t[0], null),
                  SizedBox(
                      width: w * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widgets.myInputField(
                              w * 0.4, w, "Glucose", "110.586626", t[1], null),
                          widgets.myInputField(w * 0.4, w, "BloodPressure",
                              "68.094985", t[2], null)
                        ],
                      )),
                  SizedBox(
                      width: w * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widgets.myInputField(w * 0.4, w, "SkinThickness",
                              "20.052432", t[3], null),
                          widgets.myInputField(
                              w * 0.4, w, "Insulin", "70.563830", t[4], null)
                        ],
                      )),
                  SizedBox(
                      width: w * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widgets.myInputField(
                                w * 0.4, w, "BMI", "30.567477", t[5], null),
                            widgets.myInputField(
                                w * 0.4,
                                w,
                                "DiabetesPedigreeFunction",
                                "0.434676",
                                t[6],
                                null)
                          ])),
                  widgets.myInputField(w * 0.9, w, "Age", "31", t[7], null),
                  BlocProvider(
                    create: (context) => diabetesCubit(),
                    child: BlocBuilder<diabetesCubit, diabetesState>(
                        builder: (context, state) {
                      if (state is diabetesStateFilling) {
                        return InkWell(
                          onTap: () {
                            List<num> l = [];
                            for (var element in t) {
                              l.add(num.parse(element.text));
                              element.dispose();
                            }
                            context.read<diabetesCubit>().submitted(l);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: w * 0.9,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 206, 212, 218),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Submit",
                              style: GoogleFonts.getFont("Gowun Dodum")
                                  .copyWith(
                                      color:
                                          const Color.fromARGB(255, 33, 37, 41),
                                      fontSize: (w / 100) * 8),
                            ),
                          ),
                        );
                      } else {
                        if (state is diabetesStateSubmitted) {
                          getResult(state);
                        }
                        return Container(
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
                ])));
  }

  void getResult(state) async {
    outcome.result = await state.ah.predictDiabetes(state.l);
    await Navigator.popAndPushNamed(context, routes.outcome);
  }
}

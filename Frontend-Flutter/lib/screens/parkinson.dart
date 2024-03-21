import 'package:dieases_prediction/commonWidgets.dart';
import 'package:dieases_prediction/cubits/parkinson/parkinson_cubit.dart';
import 'package:dieases_prediction/cubits/parkinson/parkinson_state.dart';
import 'package:dieases_prediction/globalVariables.dart';
import 'package:flutter/material.dart';
// import 'package:dieases_prediction/routes.dart';
import 'package:dieases_prediction/screens/outcome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class parkinson extends StatefulWidget {
  const parkinson({super.key});

  @override
  State<parkinson> createState() => _parkinsonState();
}

class _parkinsonState extends State<parkinson> {
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
            color: globalVariables.dark2,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: h,
                      width: w * 0.9,
                      margin: EdgeInsets.only(top: (h / 100) * 3),
                      child: ListView.builder(
                        addAutomaticKeepAlives:
                            true, //not rerender when scrolled out//as textediditing controller was called after being disposes
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            globalVariables.parkinsonReportValueNames.length,
                        itemBuilder: (BuildContext context, int index) {
                          return globalVariables.c.myInputField(
                              w * 0.9,
                              w,
                              globalVariables.parkinsonReportValueNames[index],
                              "Male",
                              t[index],
                              null);
                        },
                      ),
                    ),
                    BlocProvider(
                      create: (context) => parkinsonCubit(),
                      child: BlocBuilder<parkinsonCubit, parkinsonState>(
                          builder: (context, state) {
                        if (state is parkinsonStateFilling) {
                          return InkWell(
                            onTap: () {
                              List<num> l = [];
                              for (var element in t) {
                                l.add(num.parse(element.text));
                                // element.dispose();
                              }
                              context.read<parkinsonCubit>().submitted(l);
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: (h / 100) * 3),
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
                                        color: globalVariables.dark1,
                                        fontSize: (w / 100) * 8),
                              ),
                            ),
                          );
                        } else {
                          if (state is parkinsonStateSubmitted) {
                            getResult(state);
                          }
                          return Container(
                              margin: EdgeInsets.only(bottom: (h / 100) * 3),
                              padding: const EdgeInsets.all(10),
                              width: (w / 100) * 15,
                              height: (h / 100) * 6,
                              color: globalVariables.dark1,
                              child: CircularProgressIndicator(
                                  color: globalVariables.light1));
                        }
                      }),
                    )
                    //Pregnancies Glucose BloodPressure SkinThickness Insulin BMI DiabetesPedigreeFunction Age
                  ]),
            )));
  }

  void getResult(state) async {
    var r = await state.ah.predictParkinson(state.l);
    var n = "Parkinson";
    // print(1);
    // t.forEach((element) {element.dispose();});
    // await Navigator.popAndPushNameFd(context, routes.outcome);
    await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => outcome(diseaseName: n, result: r)));
  }

  // @override
  // void dispose() {
  //   t.forEach((element) {
  //     element.dispose();
  //   });
  // }
}

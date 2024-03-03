import 'package:dieases_prediction/cubits/solution/solution_cubit.dart';
import 'package:dieases_prediction/cubits/solution/solution_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class solution extends StatefulWidget {
  String disease = "";
  solution({super.key, required this.disease});
  @override
  State<solution> createState() => _solutionState(disease: disease);
}

class _solutionState extends State<solution> {
  String disease = "";
  _solutionState({required this.disease});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: const Color.fromARGB(255, 222, 226, 230), size: (w / 100) * 6),
          backgroundColor: const Color.fromARGB(255, 33, 37, 41),
        ),
        drawer: Drawer(
            backgroundColor: const Color.fromARGB(255, 52, 58, 64),
            // elevation: 10,
            child: ListView(children: const [])),
        body: Container(
          child: BlocProvider(
              create: (context) => solutionCubit(),
              child: BlocBuilder<solutionCubit, solutionnState>(
                  builder: (context, state) {
                //context.read()... should be used inside a widget that is the child of the builder
                if (state is solutionStateLoaded) {
                  return Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: w,
                      height: h,
                      color: const Color.fromARGB(255, 33, 37, 41),
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Container(
                              margin: EdgeInsets.only(top: (h / 100) * 5),
                              child: Text(
                                "Follow the given Instruction and Diet Chart",
                                style: GoogleFonts.getFont("Gowun Dodum")
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            200, 222, 226, 230),
                                        fontSize: (w / 100) * 6,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: (h / 100) * 4),
                                child: Text(
                                  "Instructions",
                                  style: GoogleFonts.getFont("Gowun Dodum")
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 222, 226, 230),
                                          fontSize: (w / 100) * 7,
                                          fontWeight: FontWeight.bold),
                                )),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.textSol.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    color: (index % 2 == 0)
                                        ? const Color.fromARGB(
                                            255, 222, 226, 230)
                                        : const Color.fromARGB(255, 33, 37, 41),
                                    margin: EdgeInsets.only(top: (h / 100) * 3),
                                    child: ListTile(
                                        leading: Icon(
                                          Icons.arrow_forward_rounded,
                                          size: (h / 100) * 2,
                                          color: (index % 2 == 0)
                                              ? const Color.fromARGB(
                                                  170, 33, 37, 41)
                                              : const Color.fromARGB(
                                                  170, 222, 226, 230),
                                        ),
                                        title: Text(
                                          state.textSol[index],
                                          style: GoogleFonts.getFont(
                                                  "Gowun Dodum")
                                              .copyWith(
                                                  color: (index % 2 == 0)
                                                      ? const Color.fromARGB(
                                                          255, 33, 37, 41)
                                                      : const Color.fromARGB(
                                                          255, 222, 226, 230),
                                                  fontSize: (w / 100) * 5.5),
                                        )));
                              },
                            ),
                            Container(
                                margin: EdgeInsets.only(top: (h / 100) * 4),
                                child: Text(
                                  "Diet Charts",
                                  style: GoogleFonts.getFont("Gowun Dodum")
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 222, 226, 230),
                                          fontSize: (w / 100) * 7,
                                          fontWeight: FontWeight.bold),
                                )),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.dietCharts.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    color: (index % 2 == 0)
                                        ? const Color.fromARGB(
                                            255, 222, 226, 230)
                                        : const Color.fromARGB(255, 33, 37, 41),
                                    margin: EdgeInsets.only(top: (h / 100) * 3),
                                    child: ListTile(
                                        leading: Icon(
                                          Icons.arrow_forward_rounded,
                                          size: (h / 100) * 2,
                                          color: (index % 2 == 0)
                                              ? const Color.fromARGB(
                                                  170, 33, 37, 41)
                                              : const Color.fromARGB(
                                                  170, 222, 226, 230),
                                        ),
                                        title: Text(
                                          state.dietCharts[index],
                                          style: GoogleFonts.getFont(
                                                  "Gowun Dodum")
                                              .copyWith(
                                                  color: (index % 2 == 0)
                                                      ? const Color.fromARGB(
                                                          255, 33, 37, 41)
                                                      : const Color.fromARGB(
                                                          255, 222, 226, 230),
                                                  fontSize: (w / 100) * 5.5),
                                        )));
                              },
                            )
                          ])));
                } else {
                  // context.read<solutionCubit>().load(disease);
                  return Container();
                }
              })),
        ));
  }
}

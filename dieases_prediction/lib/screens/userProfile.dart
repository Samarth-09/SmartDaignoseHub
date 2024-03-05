import 'package:dieases_prediction/commonWidgets.dart';
import 'package:dieases_prediction/cubits/userProfile/userProfileCubit.dart';
import 'package:dieases_prediction/cubits/userProfile/userProfileState.dart';
import 'package:dieases_prediction/globalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: commonWidgets.appBar(w),
      drawer: commonWidgets.drawer(w, h),
      bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.shifting,
          elevation: 10,
          backgroundColor: globalVariables.light1,
          items: [
            BottomNavigationBarItem(
                label: 'Profile',
                //backgroundColor: Colors.amber,
                activeIcon: Icon(Icons.person_2_outlined,
                    size: (w / 100) * 8, color: globalVariables.dark1),
                icon: Icon(Icons.person_2_outlined,
                    color: globalVariables.dark1)),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.check, color: globalVariables.dark1))
          ]),
      body: BlocProvider(
          create: (context) => userProfileCubit(),
          child: BlocBuilder<userProfileCubit, userProfileState>(
            builder: (context, state) {
              if (state is userProfileLoaded) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  //alignment: Alignment.center,
                  width: w,
                  height: h,
                  color: globalVariables.dark1,
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                            margin: EdgeInsets.only(top: (h / 100) * 3),
                            child: Text.rich(TextSpan(
                                text: "Welcome",
                                style: GoogleFonts.getFont("Gowun Dodum")
                                    .copyWith(
                                        color: const Color.fromARGB(
                                            200, 222, 226, 230),
                                        fontSize: (w / 100) * 8,
                                        fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: " ${state.uname}",
                                      style: GoogleFonts.getFont("Gowun Dodum")
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 248, 249, 250),
                                              fontSize: (w / 100) * 8,
                                              fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: " !!",
                                      style: GoogleFonts.getFont("Gowun Dodum")
                                          .copyWith(
                                              color: const Color.fromARGB(
                                                  200, 222, 226, 230),
                                              fontSize: (w / 100) * 8,
                                              fontWeight: FontWeight.bold))
                                ]))),
                        Container(
                          margin: EdgeInsets.only(top: (h / 100) * 2),
                          child: Text(
                            state.email,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                                color: globalVariables.light2,
                                fontSize: (w / 100) * 6,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: (h / 100) * 3),
                          child: Text(
                            "Past Diagnoses",
                            style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                                color: globalVariables.light1,
                                fontSize: (w / 100) * 5),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: (h / 100) * 1),
                          child: const Divider(
                              color: Color.fromARGB(175, 222, 226, 230),
                              thickness: 2),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: (h / 100) * 3),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.diseaseHistory.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: (h / 100) * 3),
                                padding: EdgeInsets.all(10),
                                // height: h * 0.135,
                                width: w * 0.9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 222, 226, 230)),

                                child: Column(children: [
                                  Text(
                                    state.diseaseHistory[index].date,
                                    style: GoogleFonts.getFont("Gowun Dodum")
                                        .copyWith(
                                            color: const Color.fromARGB(
                                                255, 33, 37, 41),
                                            fontSize: (w / 100) * 6,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: (h / 100) * 0.8),
                                    child: const Divider(
                                        color: Color.fromARGB(255, 33, 37, 41),
                                        thickness: 2),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: (h / 100) * 1.2),
                                    //height: h * 0.2,
                                    child: Row(
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            state.diseaseHistory[index].name,
                                            style: GoogleFonts.getFont(
                                                    "Gowun Dodum")
                                                .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 33, 37, 41),
                                                    fontSize: (w / 100) * 6,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Text.rich(TextSpan(
                                              text: "Result:- ",
                                              style: GoogleFonts.getFont(
                                                      "Gowun Dodum")
                                                  .copyWith(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 33, 37, 41),
                                                      fontSize: (w / 100) * 5),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        "${state.diseaseHistory[index].outcome}",
                                                    style: GoogleFonts.getFont(
                                                            "Gowun Dodum")
                                                        .copyWith(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                33, 37, 41),
                                                            fontSize:
                                                                (w / 100) * 6,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))
                                              ])),
                                        ]),
                                  )
                                ]),
                              );
                            },
                          ),
                        ),
                      ])),
                );
              } else {
                return Container();
              }
            },
          )),
    );
  }
}

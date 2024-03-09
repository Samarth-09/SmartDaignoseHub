import 'package:dieases_prediction/globalVariables.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class commonWidgets {
  static var current = 0;
  static var l = [
    "Home",
    "Profile",
    "Login/SignUp",
    "Predict Disease",
    "FeedBack",
    "About Us"
  ];
  static var i = [
    Icons.home_filled,
    Icons.person_2_sharp,
    Icons.login,
    Icons.heart_broken,
    Icons.feedback_sharp,
    Icons.group
  ];
  static var r = [
    routes.welcome,
    routes.userProfile,
    routes.login,
    routes.selectDisease
  ];
  static Widget drawer(double w, double h) {
    return Drawer(
      backgroundColor: globalVariables.dark2,
      // elevation: 10,
      child: ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            current = index;
            var res = await globalVariables.chechTokenPresence(context);
            if (res == 1) {
              await Navigator.pushNamed(context, r[index % 4]);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: globalVariables.light1,
                  content: Text("Login first",
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          fontSize: (w / 100) * 5,
                          color: globalVariables.dark1))));
              await Navigator.pushNamed(context, routes.login);
            }
          },
          child: Container(
              margin: EdgeInsets.only(top: (h / 100) * 3),
              // height: (h / 100) * 10,
              child: Column(children: [
                ListTile(
                    leading: Icon(i[index],
                        size:
                            (current == index) ? (w / 100) * 6 : (w / 100) * 5,
                        color: (current == index)
                            ? globalVariables.light3
                            : globalVariables.light1),
                    title: Text(
                      l[index],
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          fontSize: (current == index)
                              ? (w / 100) * 6
                              : (w / 100) * 5,
                          color: (current == index)
                              ? globalVariables.light3
                              : globalVariables.light1),
                    )),
                // Divider(thickness: 2, color: globalVariables.light2)
              ])),
        ),
      ),
    );
  }

  static AppBar appBar(double w) {
    return AppBar(
        elevation: 0,
        iconTheme:
            IconThemeData(color: globalVariables.light1, size: (w / 100) * 6),
        backgroundColor: globalVariables.dark1 //Color.fromARGB(0, 0, 0, 0),
        );
  }

  static Widget myInputField(double w, double fs, String lt, String ht,
      TextEditingController t, Icon? i) {
    return Container(
      margin: EdgeInsets.only(bottom: (fs / 100) * 7),
      width: w,
      child: TextFormField(
        obscureText: (lt == "password") ? true : false,
        controller: t,
        maxLines: (lt == "password") ? 1 : null,
        style: GoogleFonts.getFont("Gowun Dodum").copyWith(
            color: const Color.fromARGB(210, 248, 249, 250),
            fontSize: (fs / 100) * 6),
        cursorColor: const Color.fromARGB(255, 248, 249, 250),
        decoration: InputDecoration(
            prefixIcon: i,
            filled: true,
            fillColor: const Color.fromARGB(255, 33, 37, 41),
            labelText: "Enter $lt",
            labelStyle: GoogleFonts.getFont("Gowun Dodum").copyWith(
                color: const Color.fromARGB(210, 248, 249, 250),
                fontSize: (fs / 100) * 5),
            hintText: "like:- $ht",
            hintStyle: GoogleFonts.getFont("Gowun Dodum").copyWith(
                color: const Color.fromARGB(200, 248, 249, 250),
                fontSize: (fs / 100) * 5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none))),
      ),
    );
  }
}

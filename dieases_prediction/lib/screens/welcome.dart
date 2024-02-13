import 'package:dieases_prediction/globalVariables.dart';
import 'package:dieases_prediction/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Color.fromARGB(255, 222, 226, 230), size: (w / 100) * 6),
          backgroundColor: Color.fromARGB(255, 33, 37, 41),
        ),
        drawer: Drawer(
            backgroundColor: Color.fromARGB(255, 52, 58, 64),
            // elevation: 10,
            child: ListView(children: [])),
        body: Container(
          alignment: Alignment.center,
          width: w,
          height: h,
          color: const Color.fromARGB(255, 33, 37, 41),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: (h / 100) * 2),
                child: Text(
                  "WELCOME..!",
                  style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                      color: const Color.fromARGB(255, 222, 226, 230),
                      fontSize: (w / 100) * 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: (h / 100) * 2),
                child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/img1.jpeg",
                      width: w * 0.9,
                      height: h * 0.4,
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: (h / 100) * 2),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                    "We're here to empower you with valuable insights into you health. Get ready to embark on a journey of productive wellness management. Let's predict and prevent together!",
                    style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                      color: const Color.fromARGB(255, 222, 226, 230),
                      fontSize: (w / 100) * 4,
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.only(bottom: (h / 100) * 10),
                    width: w * 0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 226, 230),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Disease Desciption",
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(255, 33, 37, 41),
                          fontSize: (w / 100) * 5,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(right: (w/100) *2),
                  width: w,
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () async {
                      if(globalVariables.token == "")
                      {
                        await Navigator.pushNamed(context, routes.login);
                      }
                      else{
                        // await Navigator.pushNamed(context, routes.predictDiabetes);
                      }
                    },
                    child: Container(
                        width: w * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 222, 226, 230),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Diagnose",
                          style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                              color: const Color.fromARGB(255, 33, 37, 41),
                              fontSize: (w / 100) * 5,
                              fontWeight: FontWeight.bold),
                        )),
                  ))
            ],
          ),
        ));
  }
}

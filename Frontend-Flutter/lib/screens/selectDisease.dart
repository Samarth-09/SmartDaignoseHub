import 'package:dieases_prediction/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class selectDisease extends StatefulWidget {
  const selectDisease({super.key});

  @override
  State<selectDisease> createState() => _selectDiseaseState();
}

class _selectDiseaseState extends State<selectDisease> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        "assets/images/img3.png",
        width: w,
        height: h,
        fit: BoxFit.cover,
      ),
      Container(
          padding: const EdgeInsets.all(10),
          width: w,
          height: h,
          color: const Color.fromARGB(220, 52, 58, 64),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: (h / 100) * 8),
                    child: Text.rich(TextSpan(
                        text: "Welcome",
                        style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                            color: const Color.fromARGB(255, 233, 236, 239),
                            fontSize: (w / 100) * 8,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        children: [
                          TextSpan(
                              text:
                                  "  to our multi disease prediction app.",
                              style: GoogleFonts.getFont("Gowun Dodum")
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          255, 233, 236, 239),
                                      fontSize: (w / 100) * 5,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                                      TextSpan(
                              text:
                                  "Let's check your disease. We hope you will be in safe zome from this diseases. But for the sale of ensurance, we preffer you to check once.",
                              style: GoogleFonts.getFont("Gowun Dodum")
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          200, 233, 236, 239),
                                      fontSize: (w / 100) * 5,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal))
                        ])),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: (h / 100) * 7),
                      child: Text(
                        "LET'S CHECK",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                            color: const Color.fromARGB(255, 233, 236, 239),
                            fontSize: (w / 100) * 12,
                            fontWeight: FontWeight.w900),
                      )),
                  InkWell(
                      onTap: () async {
                        await Navigator.pushNamed(
                            context, routes.predictDiabetes);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: (h / 100) * 5),
                        alignment: Alignment.center,
                        width: w * 0.6,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 236, 239),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Diabetes",
                          style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                              color: const Color.fromARGB(255, 33, 37, 41),
                              fontSize: (w / 100) * 6,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: (h / 100) * 5),
                        alignment: Alignment.center,
                        width: w * 0.6,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 236, 239),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Heart Disease",
                          style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                              color: const Color.fromARGB(255, 33, 37, 41),
                              fontSize: (w / 100) * 6,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(top: (h / 100) * 5),
                        alignment: Alignment.center,
                        width: w * 0.6,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 236, 239),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Parkinson",
                          style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                              color: const Color.fromARGB(255, 33, 37, 41),
                              fontSize: (w / 100) * 6,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ]),
          )),
    ]));
  }
}

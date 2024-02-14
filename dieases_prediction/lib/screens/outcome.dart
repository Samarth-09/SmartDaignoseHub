import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class outcome extends StatefulWidget {
  static int result = 0;
  static String dieasesName = "Diabetes";
  const outcome({super.key});

  @override
  State<outcome> createState() => _outcomeState();
}

class _outcomeState extends State<outcome> {
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
          padding: EdgeInsets.all(10),
          width: w,
          height: h,
          color: const Color.fromARGB(220, 52, 58, 64),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Container(
                  margin: EdgeInsets.only(top: (h / 100) * 7),
                  child: Text(
                    (outcome.result != 0) ? "OOPS..!!" : "Fabulous!!!",
                    style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                        color: const Color.fromARGB(255, 233, 236, 239),
                        fontSize: (w / 100) * 8,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: Text(
                      (outcome.result != 0)
                          ? "You have ${outcome.dieasesName}"
                          : "You are safe from this ${outcome.dieasesName} disease.",
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(255, 233, 236, 239),
                          fontSize: (w / 100) * 6,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: Text(
                      (outcome.result != 0)
                          ? "Don't worry, we have provided a solution to conquer this disease and hope you will get well soon"
                          : "Now you can reach out in more detail this diseases by visiting tutorials provided below:- ",
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(200, 233, 236, 239),
                          fontSize: (w / 100) * 5,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                    child: (outcome.result != 0)
                        ? InkWell(
                            onTap: () {},
                            child: Container(
                              width: w * 0.8,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(top: (h / 100) * 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 233, 236, 239)),
                              child: Text("Solution to Overcome",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont("Gowun Dodum")
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 33, 37, 41),
                                          fontSize: (w / 100) * 5,
                                          fontWeight: FontWeight.bold)),
                            ),
                          )
                        : Container()),
                Container(
                  margin: EdgeInsets.only(top: (h / 100) * 5),
                  child: Text(
                    "Tutorials related to Disease:- ",
                    style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                        color: const Color.fromARGB(200, 233, 236, 239),
                        fontSize: (w / 100) * 5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Uri u = Uri.parse(
                        "https://youtu.be/-B-RVybvffU?si=AapR_yzGcqV2wQPX");
                    if (await launchUrl(u)) {
                      await launchUrl(u);
                    } else {
                      throw 'Could not launch $u';
                    }
                  },
                  child: Container(
                    width: w*0.9,
                    margin: EdgeInsets.only(top: (h / 100) * 5),
                    child: Text(
                      "Link 1",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(255, 233, 236, 239),
                          fontSize: (w / 100) * 6,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Uri u = Uri.parse(
                        "https://youtu.be/XfyGv-xwjlI?si=0Xpfyp9qvhlrQE-X");
                    if (await launchUrl(u)) {
                      await launchUrl(u);
                    } else {
                      throw 'Could not launch $u';
                    }
                  },
                  child: Container(
                    width: w*0.9,
                    margin: EdgeInsets.only(top: (h / 100) * 3),
                    child: Text(
                      "Link 2",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(255, 233, 236, 239),
                          fontSize: (w / 100) * 6,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Uri u = Uri.parse(
                        "https://youtu.be/wZAjVQWbMlE?si=H_hgSog6HQl6ZNIZ");
                    if (await launchUrl(u)) {
                      await launchUrl(u);
                    } else {
                      throw 'Could not launch $u';
                    }
                  },
                  child: Container(
                    width: w*0.9,
                    margin: EdgeInsets.only(top: (h / 100) * 3),
                    child: Text(
                      "Link 3",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(255, 233, 236, 239),
                          fontSize: (w / 100) * 6,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ])))
    ]));
  }
}

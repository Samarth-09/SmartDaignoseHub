import 'package:dieases_prediction/commonWidgets.dart';
import 'package:dieases_prediction/screens/diseaseDetialDescription.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class diseaseDescreption extends StatefulWidget {
  const diseaseDescreption({super.key});

  @override
  State<diseaseDescreption> createState() => _diseaseDescreptionState();
}

class _diseaseDescreptionState extends State<diseaseDescreption> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: commonWidgets.appBar(w),
        drawer: commonWidgets.drawer(w, h),
        body: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: w,
            height: h,
            color: const Color.fromARGB(255, 33, 37, 41),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: (h / 100) * 3),
                child: Text(
                  "Disease Descreption",
                  style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                      color: const Color.fromARGB(255, 222, 226, 230),
                      fontSize: (w / 100) * 8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              card(
                  w,
                  h,
                  "assets/images/img4.jpg",
                  // "images/img4.jpg",
                  "Diabetes",
                  "Diabetes is a chronic condition characterized by elevated levels of blood glucose (sugar). There are two main types: Type 1 diabetes, where the body does not produce insulin, and Type 2 diabetes, where the body's cells do not respond effectively to insulin. Insulin is a hormone that regulates blood sugar. Diabetes can lead to various complications, including cardiovascular disease, kidney disease, and nerve damage. Management involves lifestyle changes, medication, and insulin therapy.",
                  "file"),
              card(
                  w,
                  h,
                  "assets/images/img5.jpg",
                  // "images/img5.jpg",
                  "Heart Disease",
                  "Heart disease, also known as cardiovascular disease, refers to a range of conditions that affect the heart and blood vessels. These conditions can include coronary artery disease, heart failure, arrhythmias, and valvular disorders. Heart disease often involves the buildup of fatty deposits (plaque) in the arteries, which can lead to reduced blood flow to the heart and other complications.",
                  "file"),
              card(
                  w,
                  h,
                  "assets/images/img6.jpg",
                  // "images/img6.jpg",
                  "Parkinson",
                  "Parkinson's disease is a neurodegenerative disorder that primarily affects movement. It is characterized by the gradual loss of dopamine-producing cells in the brain. Common symptoms include tremors, stiffness, bradykinesia (slowness of movement), and postural instability. Parkinson's disease can also lead to non-motor symptoms, such as cognitive changes and mood disorders.",
                  "file")
            ]))));
  }

  Widget card(
      double w, double h, String img, String name, String desc, String file) {
    return Container(
      width: w * 0.9,
      margin: EdgeInsets.only(top: (h / 100) * 5),
      //padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 222, 226, 230),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: (h / 100) * 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                img,
                width: w * 0.9,
                height: h * 0.25,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(bottom: (h / 100) * 2),
            child: Text(
              name,
              style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                  color: const Color.fromARGB(255, 33, 37, 41),
                  fontSize: (w / 100) * 7,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
            width: w * 0.9,
            height: h * 0.2,
            child: ListView(children: [
              Container(
                  margin: EdgeInsets.only(bottom: (h / 100) * 2),
                  child: Text(
                    desc,
                    style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                      color: const Color.fromARGB(255, 33, 37, 41),
                      fontSize: (w / 100) * 5,
                    ),
                  )),
              Container(
                width: w * 0.9,
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                diseaseDetailDescription(disease: name),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 33, 37, 41),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Analysis->",
                        style: GoogleFonts.getFont("Gowun Dodum").copyWith(
                          color: const Color.fromARGB(255, 222, 226, 230),
                          fontSize: (w / 100) * 5,
                        ),
                      ),
                    )),
              )
            ]),
          )
        ],
      ),
    );
  }
}

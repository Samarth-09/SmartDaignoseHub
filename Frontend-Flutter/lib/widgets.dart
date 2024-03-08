import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class widgets {
  static Widget myInputField(
      double w, double fs, String lt, String ht, TextEditingController t, Icon? i) {
    return SizedBox(
      width: w,
      child: TextFormField(
        obscureText: (lt == "password") ? true : false,
        controller: t,
        maxLines:(lt == "password") ? 1: null,
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

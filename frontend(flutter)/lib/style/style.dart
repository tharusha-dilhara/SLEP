import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slep/const/colors.dart';

var main_box = BoxDecoration(
    borderRadius: BorderRadius.circular(16.0), color: shape_filling_white);

var date_scrol_shape = BoxDecoration(
    borderRadius: BorderRadius.circular(26),
    color: Color.fromARGB(102, 163, 163, 217));

var heading = GoogleFonts.poppins(
    textStyle:
        TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: slep_blue));

var second_heading = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 14.0, color: slep_blue));

var third_Heading = second_heading.copyWith(fontSize: 12);

var text = GoogleFonts.poppins(
    textStyle: TextStyle(color: nomal_text, fontSize: 10.0));

// Text(
//   '02:21:02',
//   style: second_heading.copyWith(
//       color: shape_filling_white,
//       fontWeight: FontWeight.bold),
// )

// var timer_text = TextStyle(fontSize: 10, backgroundColor: shape_filling_dark,fontFamily: GoogleFonts.poppins());
var timer_text = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: 14,
        backgroundColor: shape_filling_dark,
        color: shape_filling_white,
        fontWeight: FontWeight.bold));

var timer_weight =
    TextStyle(backgroundColor: shape_filling_dark, color: shape_filling_white);

var s_12 = SizedBox(
  height: 12.0,
);



var error = GoogleFonts.poppins(
    textStyle: TextStyle(
        fontWeight: FontWeight.normal, fontSize: 12, color: Colors.red[900]));

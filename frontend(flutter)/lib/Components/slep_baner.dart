import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slep/const/colors.dart';
import 'package:slep/style/style.dart';

class slepBaner extends StatelessWidget {
  const slepBaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 212,
      height: 110,
      child: Column(
        children: [
          Container(
            width: 212,
            height: 86,
            child: Row(
              children: [
                Container(
                  child: Image(
                      height: 46,
                      width: 46,
                      image: AssetImage('lib/asset/images/logo.png')),
                  height: 86,
                  width: 64,
                ),
                Container(
                  height: 86,
                  width: 148,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      'SLEP',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: slep_blue)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Text(
              'Student Learing Easiest Platform',
              style: text.copyWith(fontSize: 10, letterSpacing: 1),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:slep/Components/date_scrol_com_light.dart';
import 'package:slep/const/colors.dart';

import 'package:slep/style/style.dart';
import 'package:slep/Components/date_scrol_com_dark.dart';

import 'home_bg_image.dart';
import 'slep_baner.dart';
import 'package:icon_badge/icon_badge.dart';


class topMainCom extends StatefulWidget {
  const topMainCom({super.key});

  @override
  State<topMainCom> createState() => _topMainComState();
}

class _topMainComState extends State<topMainCom> {

 



  @override
  Widget build(BuildContext context) {

  


    return Container(
      child: Column(
        children: [
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       dateScrolComLight(d1: "sat", d2: "18 Dec"),
          //       dateScrolComDark(d1: "Today", d2: "18 Dec"),
          //       dateScrolComLight(d1: "mon", d2: "18 Dec"),
          //     ],
          //   ),
          // ),
          

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [slepBaner(), homeBgImage()],
            ),
          )
        ],
      ),
      width: double.infinity,
      height: 141.00,
      padding: EdgeInsets.all(12.0),
      decoration: main_box.copyWith(color: shape_filling_white),
    );
  }
}

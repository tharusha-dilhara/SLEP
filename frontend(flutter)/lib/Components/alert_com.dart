import 'package:flutter/material.dart';
import 'package:slep/const/colors.dart';
import 'package:slep/const/icons.dart';
import 'package:slep/screen/aboutus.dart';
import 'package:slep/screen/privacy.dart';
import 'package:slep/screen/setting.dart';
import 'package:slep/screen/support_link.dart';
import 'package:slep/style/style.dart';
import 'package:slep/screen/contatus.dart';
import 'package:auto_size_text/auto_size_text.dart';

class alertCom extends StatefulWidget {
  var name;
  var icon_name;
  alertCom({super.key, required this.name, required this.icon_name});

  @override
  State<alertCom> createState() => _alertComState();
}

class _alertComState extends State<alertCom> {
  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.only(top: 16.0),
    //   child: Container(
    //     width: double.infinity,
    //     height: 120.0,
    //     decoration: main_box,
    //     padding: EdgeInsets.all(15),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Container(
    //             child: Container(
    //           child: Row(
    //             children: [
    //               Image(
    //                 image:
    //                     AssetImage('lib/asset/icons/${widget.icon_name}.png'),
    //                 width: 30,
    //                 height: 30,
    //                 color: slep_blue,
    //               ),
    //               SizedBox(
    //                 width: 13,
    //               ),
    //               Text(
    //                 widget.name,
    //                 style: heading,
    //               ),
    //               AutoSizeText(
    //                 'A really long String',
    //                 style: TextStyle(fontSize: 30),
    //                 minFontSize: 18,
    //                 maxLines: 4,
    //                 overflow: TextOverflow.ellipsis,
    //               )
    //             ],
    //           ),
    //         )),
    //       ],
    //     ),
    //   ),
    // );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: main_box,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AutoSizeText(
            widget.name,
            style: second_heading,
            minFontSize: 4,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

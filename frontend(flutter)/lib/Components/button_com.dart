import 'package:flutter/material.dart';
import 'package:slep/const/colors.dart';
import 'package:slep/const/icons.dart';
import 'package:slep/screen/aboutus.dart';
import 'package:slep/screen/privacy.dart';
import 'package:slep/screen/setting.dart';
import 'package:slep/screen/support_link.dart';
import 'package:slep/style/style.dart';
import 'package:slep/screen/contatus.dart';

class buttonCom extends StatefulWidget {
  var  name;
  var  icon_name;

  buttonCom({super.key, required this.name, required this.icon_name});

  @override
  State<buttonCom> createState() => _buttonComState();
}

class _buttonComState extends State<buttonCom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: double.infinity,
        height: 80.0,
        decoration: main_box,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Container(
              child: Row(
                children: [
                  Image(
                    image:
                        AssetImage('lib/asset/icons/${widget.icon_name}.png'),
                    width: 30,
                    height: 30,
                    color: slep_blue,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    widget.name,
                    style: heading,
                  )
                ],
              ),
            )),
            Container(
              child: next,
            )
          ],
        ),
      ),
    );
  }
}

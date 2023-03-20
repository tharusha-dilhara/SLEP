import 'package:flutter/material.dart';
import 'package:slep/const/colors.dart';

class dateScrolComDark extends StatefulWidget {
  final String d1;
  final String d2;
  dateScrolComDark({super.key, required this.d1, required this.d2});

  @override
  State<dateScrolComDark> createState() => _dateScrolComDarkState();
}

class _dateScrolComDarkState extends State<dateScrolComDark> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          widget.d1,
          style: TextStyle(color: slep_blue),
        ),
        Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 1.0, horizontal: 13.0),
            child: Text(
              widget.d2,
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Color.fromARGB(255, 163, 163, 217)),
        )
      ]),
    );
  }
}

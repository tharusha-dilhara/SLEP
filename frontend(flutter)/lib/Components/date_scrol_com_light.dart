import 'package:flutter/material.dart';
import 'package:slep/const/colors.dart';

class dateScrolComLight extends StatefulWidget {
  final String d1;
  final String d2;
  dateScrolComLight({super.key, required this.d1, required this.d2});

  @override
  State<dateScrolComLight> createState() => _dateScrolComLightState();
}

class _dateScrolComLightState extends State<dateScrolComLight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          widget.d1,
          style: TextStyle(color: shape_filling_light),
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
              color: shape_filling_light),
        )
      ]),
    );
  }
}

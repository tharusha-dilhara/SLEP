import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../style/style.dart';




class topweektimatableCom extends StatelessWidget {
  const topweektimatableCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: double.infinity,
          height: 113,
          decoration: main_box,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'week Timetable',
                style: heading.copyWith(fontSize: 14),
              ),
              s_12,
              Text(
                'You can see the time-table of a week in this \nsection.',
                style: text,
              ),
              s_12,
              
            ],
          ),
        ),
        Lottie.asset("lib/asset/images/wtimg.json", height: 100, width: 100)
      ],
    );
  }
}
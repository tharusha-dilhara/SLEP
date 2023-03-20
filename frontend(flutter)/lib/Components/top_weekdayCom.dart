import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../style/style.dart';




class topweekdayCom extends StatelessWidget {
  const topweekdayCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: double.infinity,
          height: 143,
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
                'You can see the time-table of a week in this \nsection. When you click on the date,',
                style: text,
              ),
              Text(
                'you can know about the modules for the\nrelevant day.',
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
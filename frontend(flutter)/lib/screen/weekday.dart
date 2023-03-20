import 'package:flutter/material.dart';
import 'package:slep/screen/weektimatable.dart';

import '../Components/button_com.dart';
import '../Components/top_weekdayCom.dart';

class weekday extends StatelessWidget {
  const weekday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34,bottom: 16,left: 16,right: 16),
          child: Column(
      children: [
          topweekdayCom(),
          GestureDetector(
            child: buttonCom(
              name: 'Monday',
              icon_name: 'date',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weektimatable(date: 'monday')),
              );
            },
          ),
          GestureDetector(
            child: buttonCom(
              name: 'Tuesday',
              icon_name: 'date',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weektimatable(date: 'tuesday')),
              );
            },
          ),
          GestureDetector(
            child: buttonCom(
              name: 'Wednesday',
              icon_name: 'date',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weektimatable(date: 'wednesday')),
              );
            },
          ),
          GestureDetector(
            child: buttonCom(
              name: 'Thursday',
              icon_name: 'date',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weektimatable(date: 'thursday')),
              );
            },
          ),
          GestureDetector(
            child: buttonCom(
              name: 'Friday',
              icon_name: 'date',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weektimatable(date: 'friday')),
              );
            },
          ),
          GestureDetector(
            child: buttonCom(
              name: 'Saturday',
              icon_name: 'date',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weektimatable(date: 'saturday')),
              );
            },
          ),
          GestureDetector(
            child: buttonCom(
              name: 'Sunday',
              icon_name: 'date',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weektimatable(date: 'sunday')),
              );
            },
          ),
          GestureDetector(
              child: buttonCom(
                name: 'Extra lectures',
                icon_name: 'date',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => weektimatable(date: 'extra')),
                );
              },
            )
      ],
    ),
        )
      ),
    );
  }
}

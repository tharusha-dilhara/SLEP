import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slep/style/style.dart';

class topSupportCom extends StatelessWidget {
  const topSupportCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: double.infinity,
          height: 213,
          decoration: main_box,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How we Support you',
                style: heading.copyWith(fontSize: 14),
              ),
              s_12,
              Text(
                ' You can get a preparation before the lesson.',
                style: text,
              ),
              Text(
                ' You can revive difficult lessons.',
                style: text,
              ),
              s_12,
              Text(
                'Steps for fallowing system.',
                style: heading.copyWith(fontSize: 14),
              ),
              s_12,
              Text(
                ' click in he subject ',
                style: text,
              ),
              Text(
                ' Next,you can see lessons related links',
                style: text,
              ),
            ],
          ),
        ),
        Lottie.asset("lib/asset/images/ai2.json", height: 100, width: 100)
      ],
    );
  }
}

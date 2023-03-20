import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class homeBgImage extends StatelessWidget {
  const homeBgImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Lottie.asset("lib/asset/images/student.json")),
      width: 100,
      height: 100,
    );
  }
}

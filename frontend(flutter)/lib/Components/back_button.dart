import 'package:flutter/material.dart';


import '../style/style.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 61,
        height: 24,
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios, size: 16),
            Text(
              'Back',
              style: second_heading.copyWith(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}

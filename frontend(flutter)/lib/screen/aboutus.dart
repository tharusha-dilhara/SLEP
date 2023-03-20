import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slep/style/style.dart';

import '../const/colors.dart';

class aboutus extends StatefulWidget {
  const aboutus({super.key});

  @override
  State<aboutus> createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/asset/images/logo.png'),
              width: 140,
              height: 140,
            ),
            Text(
              'SLEP',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: slep_blue)),
            ),
            s_12,
            Text(
              'Version 1.0.0 (Beta)',
              style: text.copyWith(fontSize: 14.0),
            ),
            Text(
              '@2022 - 2023 SLEP',
              style: text.copyWith(fontSize: 12.0),
            )
          ],
        ),
      ),
      // bottomNavigationBar
    );
  }
}

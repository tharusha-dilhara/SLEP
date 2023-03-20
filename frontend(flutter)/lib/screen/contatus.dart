import 'package:flutter/material.dart';

import '../Components/back_button.dart';
import '../const/colors.dart';
import '../style/style.dart';

class cntactus extends StatefulWidget {
  const cntactus({super.key});

  @override
  State<cntactus> createState() => _cntactusState();
}

class _cntactusState extends State<cntactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backButton(),
                      s_12,
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact us',
                              style: heading,
                            ),
                            Text(
                              'email: cont.slep@gmail.com',
                              style: text,
                            ),
                          ],
                        ),
                        height: 129.0,
                        width: double.infinity,
                        decoration: main_box,
                      ),
                      s_12,
                      Container(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feedback',
                              style: heading,
                            ),
                            Text(
                              'Leave a feedback',
                              style: text,
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: 470.0,
                        decoration: main_box,
                      )
                    ]))));
  }
}

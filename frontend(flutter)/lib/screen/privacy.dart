import 'package:flutter/material.dart';
import 'package:slep/style/style.dart';

import '../Components/back_button.dart';

import '../const/colors.dart';

class priacy extends StatefulWidget {
  const priacy({super.key});

  @override
  State<priacy> createState() => _priacyState();
}

class _priacyState extends State<priacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34,bottom: 16,left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              s_12,
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms and conditions',
                      style: heading,
                    ),
                    s_12,
                    Text(
                      'You cant enter the wrong details.',
                      style: text,
                    ),
                    Text('You can’t debug this application.', style: text),
                    Text(
                      'This is for personal use only.',
                      style: text,
                    ),
                    Text('The contents may change due to certain reasons.',
                        style: text),
                    Text(
                        'The information contained herein may not be disclosed to outside parties for any reason.',
                        style: text),
                  ],
                ),
                height: 180,
                width: double.infinity,
                decoration: main_box,
              ),
              s_12,
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy policy',
                      style: heading,
                    ),
                    s_12,
                    Text(
                      'We get your name it-index ,and Group.',
                      style: text,
                    ),
                    Text(
                        'We promise not to send out the information and not to misuse the data ',
                        style: text),
                    Text(
                      'We promise to protect your privacy.',
                      style: text,
                    ),
                  ],
                ),
                height: 164,
                width: double.infinity,
                decoration: main_box,
              ),
              s_12,
              s_12,
              Image(
                  width: double.infinity,
                  image: AssetImage('lib/asset/images/priacy_bg_image.png'))
            ],
          ),
        ),
      ),
      // bottomNavigationBar
    );
  }
}

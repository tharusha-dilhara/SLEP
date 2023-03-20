import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slep/Components/button_com.dart';
import 'package:slep/screen/aboutus.dart';
import 'package:slep/screen/contatus.dart';
import 'package:slep/screen/privacy.dart';
import 'package:slep/style/style.dart';



import '../const/colors.dart';
import 'package:slep/Components/profile_setting_com.dart';

import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';

import 'package:switcher_button/switcher_button.dart';

import 'package:url_launcher/url_launcher.dart';



class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  void reminder(BuildContext context) {
    SlideDialog.showSlideDialog(
      context: context,
      backgroundColor: background,
      pillColor: slep_blue,
      transitionDuration: Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
            padding: EdgeInsets.only(left: 46, right: 46, top: 20, bottom: 20),
            width: double.infinity,
            height: 470,
            decoration: main_box,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '5  Min Remainder',
                        style: heading,
                      ),
                      Container(
                        child: SwitcherButton(
                          offColor: shape_filling_dark,
                          onColor: slep_blue,
                          size: 50,
                          value: true,
                          onChange: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '10  Min Remainder',
                        style: heading,
                      ),
                      Container(
                        child: SwitcherButton(
                          offColor: shape_filling_dark,
                          onColor: slep_blue,
                          size: 50,
                          value: true,
                          onChange: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '30  Min Remainder',
                        style: heading,
                      ),
                      Container(
                        child: SwitcherButton(
                          offColor: shape_filling_dark,
                          onColor: slep_blue,
                          size: 50,
                          value: true,
                          onChange: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Lottie.asset("lib/asset/images/reminder.json"),
              ],
            )),
      ),
    );
  }

  void theme(BuildContext context) {
    SlideDialog.showSlideDialog(
      context: context,
      backgroundColor: background,
      pillColor: slep_blue,
      transitionDuration: Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text('test')),
      ),
    );
  }

  void contactus(BuildContext context) {
    SlideDialog.showSlideDialog(
        context: context,
        backgroundColor: background,
        pillColor: slep_blue,
        transitionDuration: Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
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
                s_12,
                Lottie.asset("lib/asset/images/contactus.json"),
              ],
            ),
            decoration: main_box,
            width: double.infinity,
            height: 470,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34, bottom: 16, left: 16, right: 16),
          child: Column(
            children: [
              profileSettingCon(),
              // GestureDetector(
              //   child: buttonCom(name: 'Theme', icon_name: 'theme'),
              //   onTap: () {
              //     theme(context);
              //   },
              // ),
              // GestureDetector(
              //   child: buttonCom(name: 'Reminder', icon_name: 'reminder'),
              //   onTap: () {
              //     reminder(context);
              //   },
              // ),
              GestureDetector(
                child: buttonCom(name: 'Contact us', icon_name: 'contactus'),
                onTap: () {
                  contactus(context);
                },
              ),
              GestureDetector(
                child: buttonCom(name: 'Privacy Policy', icon_name: 'priacy'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const priacy()),
                  );
                },
              ),
              GestureDetector(
                child: buttonCom(name: 'About us', icon_name: 'aboutus'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const aboutus()),
                  );
                },
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}



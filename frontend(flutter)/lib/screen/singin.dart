import 'dart:convert';
import 'dart:io';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slep/const/colors.dart';
import 'package:slep/screen/aboutus.dart';
import 'package:slep/screen/home.dart';
import 'package:slep/screen/onscreen.dart';
import 'package:slep/screen/singup.dart';
import 'package:slep/style/style.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../main.dart';

import 'package:cleaneasyalert/cleaneasyalert.dart';

import 'package:slide_popup_dialog_null_safety/pill_gesture.dart';
import 'package:slide_popup_dialog_null_safety/slide_dialog.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart';

class singin extends StatefulWidget {
  const singin({super.key});

  @override
  State<singin> createState() => _singinState();
}

class _singinState extends State<singin> {
 

  getlogin(String email, String password) async {
    List<dynamic> users = [];
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/login'));

      request.body =
          json.encode({"email": "${email}", "password": "${password}"});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var rs = await response.stream.bytesToString();
      Map data = jsonDecode(rs);
      print(data['token']);
      // return data['token'];
      if (response.statusCode == 200) {
        print('status code is 200');
        // final rs = getlogin(_email.text, _password.text);

        final directory = await getApplicationDocumentsDirectory();
        final file = await File('${directory.path}/my_file.txt');
        final text = await data['token'].toString();
        await file.writeAsString(text);

        final directory2 = await getApplicationDocumentsDirectory();
        final group_file = await File('${directory2.path}/group_file.txt');
        final group_no = await data['group_no'].toString();
        await group_file.writeAsString(group_no);
        print(data['group_no']);

        final directory3 = await getApplicationDocumentsDirectory();
        final batch_file = await File('${directory3.path}/batch_file.txt');
        final batch = await data['batch'].toString();
        await batch_file.writeAsString(batch);
        print(data['batch']);

        final directory4 = await getApplicationDocumentsDirectory();
        final name_file = await File('${directory3.path}/batch_file.txt');
        final name = await data['batch'].toString();
        await name_file.writeAsString(name);
        print(data['name']);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const mainpage()),
        );

        return '200';
      } else {
        setState(() {
          a = true;
          p_e = 'Invalide pasword, please try again';
          p_v = 'Invalide email ,please try again';
        });
        print('status code is 500 final print');

        return '500';
      }
    } catch (e) {
      setState(() {
        a = true;
        p_e = 'Invalide pasword, please try again';
        p_v = 'Invalide email ,please try again';
      });
      print('error catch');
      return '500';
    }
  }

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  var p_v = '';
  var p_e = '';
  var spb = '';

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  bool a = true;


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shape_filling_white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Icon Logo

                // const CircleAvatar(
                //   backgroundImage: AssetImage('lib/asset/images/logo.png'),
                //   radius: 60.0,
                // ),
                Lottie.asset("lib/asset/images/loding.json",
                    width: 220, height: 220),

                const SizedBox(
                  height: 2.0,
                ),

                //greeting text

                Text("Login Page", style: heading.copyWith(color: nomal_text)),

                const SizedBox(
                  height: 10.0,
                ),

                //email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: shape_filling_light,
                      border: Border.all(color: shape_filling_light),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),

                Text(
                  '${p_e}',
                  style: text.copyWith(color: Colors.red[900]),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                //password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: shape_filling_light,
                      border: Border.all(color: shape_filling_light),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                Text(
                  '${p_v}',
                  style: text.copyWith(color: Colors.red[900]),
                ),

                //login button
                const SizedBox(
                  height: 20.0,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: shape_filling_dark,
                        ),
                        child: Column(children: [
                          if (a == true) ...[
                            Text(
                              "Login",
                              style: second_heading.copyWith(
                                  color: shape_filling_white),
                            ),
                          ] else ...[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Loading",
                                  style: second_heading.copyWith(
                                      color: shape_filling_white),
                                ),
                                SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        shape_filling_white,
                                      ),
                                      strokeWidth: 2,
                                    ))
                              ],
                            )
                          ]
                        ])),
                    onTap: () async {
                      print(_email.text);
                      print(_password.text);
                      if (_password.text.length < 8 || _password.text.isEmpty) {
                        setState(() {
                          p_v =
                              'Invalid , password must be leess than  8 characters.';
                          a = true;
                        });
                      } else if (!isEmail(_email.text)) {
                        setState(() {
                          p_e = 'not valide email';
                          a = true;
                        });
                      } else {
                        //post request add////////////////////////////////////////////////////////////////
                        setState(() {
                          p_e = '';
                          p_v = '';
                          a = false;
                        });
                        getlogin(_email.text, _password.text);
                      }
                    },
                  ),
                ),

                //not a member? register now

                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      
                    ),
                    GestureDetector(
                      child: Text(
                        'register now',
                        style: heading,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const sngup()),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

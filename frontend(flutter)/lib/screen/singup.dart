import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:slep/screen/singin.dart';
import 'package:slep/style/style.dart';
import 'package:lottie/lottie.dart';

import '../const/colors.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:path_provider/path_provider.dart';

import '../main.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class sngup extends StatefulWidget {
  const sngup({super.key});

  @override
  State<sngup> createState() => _sngupState();
}

class _sngupState extends State<sngup> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _idnumber = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _conpassword = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  getsingup(String name, String idnumber, String password, String email,
    String batch, String group) async {
    List<dynamic> users = [];
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/register'));

      request.body = json.encode({
        "it_id": "${idnumber}",
        "batch": "${batch}",
        "group_no": "${group}",
        "name": "${name}",
        "email": "${email}",
        "password": "${password}"
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var rs = await response.stream.bytesToString();
      Map data = jsonDecode(rs);
      print(data);
      // return data['token'];
      if (response.statusCode == 200) {
        print('registered');
        // final rs = getlogin(_email.text, _password.text);

        // final directory = await getApplicationDocumentsDirectory();
        // final file = await File('${directory.path}/my_file.txt');
        // final text = await data['token'].toString();
        // await file.writeAsString(text);

        // final directory2 = await getApplicationDocumentsDirectory();
        // final group_file = await File('${directory2.path}/group_file.txt');
        // final group_no = await data['group_no'].toString();
        // await group_file.writeAsString(group_no);
        // print(data['group_no']);

        // final directory3 = await getApplicationDocumentsDirectory();
        // final batch_file = await File('${directory3.path}/batch_file.txt');
        // final batch = await data['batch'].toString();
        // await batch_file.writeAsString(batch);
        // print(data['batch']);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const singin()),
        );

        return '200';
      } else {
        print('error code 500');
        return '500';
      }
    } catch (e) {
      print('error catch');
      return '500';
    }
  }

  get selectedDataString => null;
  final List<String> group = [
    '12.1',
    '12.2',
    '13.1',
    '13.2',
    '14.1',
    '14.2',
    '15.1',
    '15.2',
    '16.1',
    '16.2',
    '17.1',
    '17.2',
  ];
  final List<String> batch = [
    'Y1S1WDIT',
  ];

  String nname = '';
  String nid = '';
  String npassword = '';
  String nConpassword = '';
  String nemail = '';
  String nbatch = '';
  String ngroup = '';
  bool vname = false;
  bool vid = false;
  bool vpassword = false;
  bool vconpassword = false;
  bool vemail = false;
  bool vbatch = false;
  bool vgroup = false;
  bool vmatch = false;
  bool s_btn = false;
  bool vlength = false;

  String? selectedValue2;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    String? selectedString;
    List<String>? selectedDataString;

    return Scaffold(
        backgroundColor: shape_filling_white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              s_12,
              Lottie.asset("lib/asset/images/singup.json",
                  width: 120, height: 120),
              Center(
                child: Text(
                  'singup Page',
                  style: heading.copyWith(color: nomal_text),
                ),
              ),
              s_12,
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
                      controller: _name,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.person_outline, color: nomal_text),
                        border: InputBorder.none,
                        hintText: 'Name',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              Text(nname, style: error),
              s_12,
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
                      controller: _idnumber,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.badge_outlined, color: nomal_text),
                        hintText: 'Id Number',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              Text(nid, style: error),
              s_12,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline, color: nomal_text),
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              Text(npassword, style: error),
              s_12,
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
                      controller: _conpassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock_outline, color: nomal_text),
                        hintText: 'Password confirm',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              Text(nConpassword, style: error),
              s_12,
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
                        counterStyle:
                            TextStyle(backgroundColor: shape_filling_dark),
                        prefixIcon:
                            Icon(Icons.email_outlined, color: nomal_text),
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
              ),
              s_12,
              Text(nemail, style: error),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomDropdownButton2(
                  buttonWidth: double.infinity,
                  dropdownWidth: double.infinity,
                  buttonHeight: 50,
                  dropdownElevation: 0,
                  dropdownDecoration: BoxDecoration(
                      color: shape_filling_white,
                      borderRadius: BorderRadius.circular(12)),
                  dropdownPadding: EdgeInsets.all(12),
                  buttonDecoration: BoxDecoration(
                      color: shape_filling_light,
                      borderRadius: BorderRadius.circular(12)),
                  hint: 'Select Batch',
                  dropdownItems: batch,
                  value: selectedValue2,
                  onChanged: (value) {
                    setState(() {
                      selectedValue2 = value;
                    });
                  },
                ),
              ),
              Text(
                nbatch,
                style: error,
              ),
              s_12,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomDropdownButton2(
                  buttonWidth: double.infinity,
                  dropdownWidth: double.infinity,
                  buttonHeight: 50,
                  dropdownElevation: 0,
                  dropdownDecoration: BoxDecoration(
                      color: shape_filling_white,
                      borderRadius: BorderRadius.circular(12)),
                  dropdownPadding: EdgeInsets.all(12),
                  buttonDecoration: BoxDecoration(
                      color: shape_filling_light,
                      borderRadius: BorderRadius.circular(12)),
                  hint: 'Select Group',
                  dropdownItems: group,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
              Text(
                ngroup,
                style: error,
              ),
              s_12,
              s_12,
              GestureDetector(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 40, right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: shape_filling_dark,
                          ),
                          child: Column(
                            children: [
                              if (s_btn == false) ...[
                                Text(
                                  "Login",
                                  style: second_heading.copyWith(
                                      color: shape_filling_white),
                                ),
                              ] else ...[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            shape_filling_white,
                                          ),
                                          strokeWidth: 2,
                                        ))
                                  ],
                                )
                              ]
                            ],
                          )),
                    )),
                onTap: () {
                  print(_name.text);
                  print(_idnumber.text);
                  print(_password.text);
                  print(_conpassword.text);
                  print(_email.text);
                  print(selectedValue);
                  print(selectedValue2);
                  if (isempty(_name.text)) {
                    setState(() {
                      nname = 'Incorrect name';
                      vname = false;
                    });
                  } else {
                    setState(() {
                      nname = '';
                      vname = true;
                    });
                  }
                  if (isempty(_idnumber.text)) {
                    setState(() {
                      nid = 'Incorrect ID Number';
                      vid = false;
                    });
                  } else {
                    setState(() {
                      nid = '';
                      vid = true;
                    });
                  }
                  if (isempty(_password.text)) {
                    setState(() {
                      npassword = 'Incorrect password';
                      vpassword = false;
                    });
                  } else {
                    setState(() {
                      npassword = '';
                      vpassword = true;
                    });
                  }
                  if (isempty(_conpassword.text)) {
                    setState(() {
                      nConpassword = 'Incorrect confirm password';
                      vconpassword = false;
                    });
                  } else {
                    nConpassword = '';
                    vconpassword = true;
                  }
                  if (!(_conpassword.text == _password.text)) {
                    setState(() {
                      npassword = 'password is not same';
                      nConpassword = 'password is not same';
                      vmatch = false;
                    });
                  } else {
                    setState(() {
                      vmatch = true;
                    });
                  }

                  if (_password.text.length < 8) {
                    setState(() {
                      npassword = 'Use 8 characters or more for your password ';
                      nConpassword =
                          'Use 8 characters or more for your password';
                      vlength = false;
                    });
                  } else {
                    setState(() {
                      vlength = true;
                    });
                  }

                  if (isempty(_email.text)) {
                    setState(() {
                      nemail = 'Incorrect Email';
                      vemail = false;
                    });
                  } else {
                    setState(() {
                      nemail = '';
                      vemail = true;
                    });
                  }
                  if (isempty(selectedValue2)) {
                    setState(() {
                      setState(() {
                        nbatch = 'Please Select Batch Number';
                      });
                    });
                  } else {
                    setState(() {
                      nbatch = '';
                      vbatch = true;
                    });
                  }
                  if (isempty(selectedValue)) {
                    setState(() {
                      ngroup = 'Please Select Group Number';
                    });
                  } else {
                    setState(() {
                      ngroup = '';
                      vgroup = true;
                    });
                  }

                  if (!vname ||
                      !vid ||
                      !vpassword ||
                      !vconpassword ||
                      !vemail ||
                      !vbatch ||
                      !vgroup ||
                      !vmatch ||
                      !vlength) {
                    s_btn = false;
                    print('not getsingup');
                  } else {
                    setState(() {
                      s_btn = true;
                    });
                    getsingup(
                        _name.text,
                        _idnumber.text,
                        _password.text,
                        _email.text,
                        selectedValue2.toString(),
                        selectedValue.toString());
                    // print(selectedValue2.toString());
                  }
                },
              ),
              s_12,
              s_12,
              s_12,
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have Account ? '),
                    Text(
                      'Login Your Accont',
                      style: heading,
                    )
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const singin()),
                  );
                },
              ),
              s_12,
              s_12,
              s_12,
              s_12,
              s_12,
              s_12,
              s_12,
              s_12,
            ],
          ),
        ));
  }

  void _onCountriesSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});
  }

  bool isempty(value) {
    if (value == null || value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

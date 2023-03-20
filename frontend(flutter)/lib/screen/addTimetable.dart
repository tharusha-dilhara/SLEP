import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shirne_dialog/shirne_dialog.dart';
import 'package:slep/Components/back_button.dart';
import 'package:slep/style/style.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:selector/selector.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../const/colors.dart';

class addTimetable extends StatefulWidget {
  final date;
  const addTimetable({super.key, @required this.date});

  @override
  State<addTimetable> createState() => _addTimetableState();
}

class _addTimetableState extends State<addTimetable> {
  TextEditingController _mod_name = new TextEditingController();
  TextEditingController _location = new TextEditingController();
  String _dmod_name = '';
  String _dlocation = '';
  bool _all_validate = false;
  String _etime = '';
  String _stime = '';

  add_time(String stime, String etime, String mod_name, String location) async {
    List<dynamic> users = [];

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    String token = await file.readAsString();

    final directory2 = await getApplicationDocumentsDirectory();
    final group_file = File('${directory2.path}/group_file.txt');
    String group = await group_file.readAsString();

    final directory3 = await getApplicationDocumentsDirectory();
    final batch_file = File('${directory3.path}/batch_file.txt');
    String batch = await batch_file.readAsString();

    try {
      var headers = {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/admin/add'));

      request.body = json.encode({
        "batch": "${batch}",
        "group_no": "${group}",
        "date": "${widget.date.toString()}",
        "start_time": "${stime}",
        "end_time": "${etime}",
        "mod_name": "${mod_name}",
        "location": "${location}"
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

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const singin()),
        // );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34, bottom: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              s_12,
              backButton(),
              s_12,
              Container(
                decoration: BoxDecoration(
                  color: shape_filling_white,
                  border: Border.all(color: shape_filling_white),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _mod_name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.badge_outlined, color: nomal_text),
                      hintText: 'Module name',
                      hintStyle: TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
              Text(
                _dmod_name,
                style: error,
              ),
              s_12,
              Container(
                decoration: BoxDecoration(
                  color: shape_filling_white,
                  border: Border.all(color: shape_filling_white),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _location,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:
                          Icon(Icons.location_on_rounded, color: nomal_text),
                      hintText: 'Location',
                      hintStyle: TextStyle(color: Color.fromARGB(100, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
              Text(
                _dlocation,
                style: error,
              ),
              s_12,
              Container(
                decoration: main_box,
                child: Column(
                  children: [
                    Text(
                      'Start time',
                      style: heading,
                    ),
                    s_12,
                    TimePickerSpinner(
                      is24HourMode: true,
                      normalTextStyle: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 197, 195, 194)),
                      highlightedTextStyle: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
                      spacing: 50,
                      itemHeight: 50,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        setState(() {
                          _stime = time.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              s_12,
              Container(
                decoration: main_box,
                child: Column(
                  children: [
                    Text(
                      'End time',
                      style: heading,
                    ),
                    s_12,
                    TimePickerSpinner(
                      is24HourMode: true,
                      normalTextStyle: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 197, 195, 194)),
                      highlightedTextStyle: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
                      spacing: 50,
                      itemHeight: 50,
                      isForce2Digits: true,
                      isShowSeconds: false,
                      onTimeChange: (time) {
                        setState(() {
                          _etime = time.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              s_12,
              GestureDetector(
                child: Container(
                    decoration: main_box.copyWith(color: shape_filling_dark),
                    width: double.infinity,
                    height: 60,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (_all_validate == false) ...[
                          Text(
                            'add time',
                            style: TextStyle(
                                color: shape_filling_white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ] else ...[
                          SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  shape_filling_white,
                                ),
                                strokeWidth: 2,
                              )),
                          Text(
                            'Loading..',
                            style: TextStyle(
                                color: shape_filling_white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ]
                      ],
                    ))),
                onTap: () {
                  if (isempty(_mod_name.text)) {
                    setState(() {
                      _dmod_name = 'Empty module name';
                    });
                  } else if (isempty(_location.text)) {
                    setState(() {
                      _dlocation = 'Empty location';
                    });
                  } else {
                    setState(() {
                      _dlocation = '';
                      _dmod_name = '';
                      _all_validate = true;
                      _etime = (_etime
                              .split(" ")[1]
                              .split(".")[0]
                              .split(":")[0]) +
                          ':' +
                          (_etime.split(" ")[1].split(".")[0].split(":")[1]) +
                          ':' +
                          '00';
                      _stime = (_stime
                              .split(" ")[1]
                              .split(".")[0]
                              .split(":")[0]) +
                          ':' +
                          (_stime.split(" ")[1].split(".")[0].split(":")[1]) +
                          ':' +
                          '00';
                      print(_mod_name.text);
                      print(_location.text);
                      print(_stime);
                      print(_etime);
                      Future<dynamic> rs = add_time(
                          _stime, _etime, _mod_name.text, _location.text);
                      AsyncSnapshot.waiting();
                      print(rs);
                      setState(() {
                        _all_validate = false;
                        MyDialog.of(context)
                            .toast('Add timatable successfully');
                        Navigator.pop(context);
                      });
                      // if (rs == '200') {
                      //   print('add subject link print status code is 200');
                      //   setState(() {
                      //     _all_validate = false;
                      //     MyDialog.of(context)
                      //         .toast('Add timatable successfully');
                      //     Navigator.pop(context);
                      //   });
                      // } else {
                      //   print(
                      //       'add subject link faild print status code is 500');
                      //   setState(() {
                      //     _all_validate = false;
                      //     MyDialog.of(context).toast('Failed to add timetable');
                      //     Navigator.pop(context);
                      //   });
                      // }
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isempty(value) {
  if (value == null || value.isEmpty) {
    return true;
  } else {
    return false;
  }
}

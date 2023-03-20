import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:slep/screen/addTimetable.dart';

import '../const/colors.dart';
import '../const/icons.dart';
import '../data/weektimatabledata.dart';
import '../screen/aboutus.dart';
import '../style/style.dart';
import 'button_com.dart';
import 'package:swipe_widget/swipe_widget.dart';

class weektimatablecom extends StatefulWidget {
  final date;

  weektimatablecom({super.key, @required this.date});

  @override
  State<weektimatablecom> createState() => _weektimatablecomState();
}

class _weektimatablecomState extends State<weektimatablecom> {
  String _role = '';

  delete_timetable(String stime, String mod_name) async {
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
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/timetable/delete'));

      request.body = json.encode({
        "batch": "${batch}",
        "group_no": "${group}",
        "date": "${widget.date.toString()}",
        "start_time": "${stime}",
        "mod_name": "${mod_name}",
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var rs = await response.stream.bytesToString();
      Map data = jsonDecode(rs);
      print(data);
      // return data['token'];
      if (response.statusCode == 200) {
        print('delete timetable');
        // final rs = getlogin(_email.text, _password.text);

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const singin()),
        // );

        return '200';
      } else {
        print('error code 500 delete timetable');
        return '500';
      }
    } catch (e) {
      print('error catch delete timetable');
      return '500';
    }
  }

  Future<List<weektimatabledata>> weektimatable() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    String token = await file.readAsString();

    final directory2 = await getApplicationDocumentsDirectory();
    final group_file = File('${directory2.path}/group_file.txt');
    String group = await group_file.readAsString();

    final directory3 = await getApplicationDocumentsDirectory();
    final batch_file = File('${directory3.path}/batch_file.txt');
    String batch = await batch_file.readAsString();

    final directory4 = await getApplicationDocumentsDirectory();
    final role_file = File('${directory.path}/roles.txt');
    _role = await role_file.readAsString();

    print(_role);

    List<weektimatabledata> users = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/timetable'));

      request.body = json.encode({
        "group_no": "${group}",
        "batch": "${batch}",
        "date": "${widget.date}"
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var rs = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        List data = jsonDecode(rs);

        for (Map item in data) {
          var date = item['date'];
          var start_time = item['start_time'];
          var end_time = item['end_time'];
          var mod_name = item['mod_name'];
          var location = item['location'];
          weektimatabledata user =
              weektimatabledata(date, start_time, end_time, mod_name, location);
          users.add(user);
        }

        print(users);

        // print(data);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const aboutus()),
        );
        print(Future.error.toString());
        return Future.error("error:${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    print(users);
    return users;
  }
  //function end

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weektimatable(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.asset("lib/asset/images/loading.json"),
          );
        } else {
          if (snapshot.data.length == null) {
            print(snapshot.data);
            return Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                child: Center(
                  child: Text(
                    'You haven\'t support module',
                    style: text,
                  ),
                ),
                width: double.infinity,
                height: 150,
                decoration: main_box,
              ),
            );
          } else {
            return Column(
              children: [
                if (_role.toString() == 'admin') ...[
                  GestureDetector(
                    child: buttonCom(
                      name: 'add timetable',
                      icon_name: 'subject',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addTimetable(
                                date: '${widget.date.toString()}')),
                      );
                    },
                  ),
                ],
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 0, right: 0, left: 0, bottom: 13),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          SwipeWidget(
                            onSwipe: () async {
                              print('delete');
                              await  delete_timetable(
                                  snapshot.data[index].start_time.toString(),
                                  snapshot.data[index].mod_name.toString());
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index].mod_name.toString(),
                                    style: heading,
                                  ),
                                  Row(
                                    children: [
                                      timer,
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data[index].start_time
                                                .toString(),
                                            style: third_Heading,
                                          ),
                                          Text(' - ', style: third_Heading),
                                          Text(
                                            snapshot.data[index].end_time
                                                .toString(),
                                            style: third_Heading,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      location,
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        snapshot.data[index].location
                                            .toString(),
                                        style: third_Heading,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              padding: EdgeInsets.all(12.0),
                              height: 101,
                              width: double.infinity,
                              decoration:
                                  main_box.copyWith(color: shape_filling_white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          }
        }
      },
    );
  }
}

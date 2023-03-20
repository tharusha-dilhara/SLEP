import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:slep/const/colors.dart';
import 'package:slep/screen/privacy.dart';
import '../const/icons.dart';
import '../data/timetable.dart';
import '../screen/aboutus.dart';
import '../style/style.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:http/http.dart' as http;
import 'package:slep/data/timetable.dart';
import 'package:lottie/lottie.dart';

class scondMainCom extends StatefulWidget {
  const scondMainCom({super.key});

  @override
  State<scondMainCom> createState() => _scondMainComState();
}

class _scondMainComState extends State<scondMainCom> {
  //function start

  Future<List<Timetable>> getUsers() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    String token = await file.readAsString();

    final directory2 = await getApplicationDocumentsDirectory();
    final group_file = File('${directory2.path}/group_file.txt');
    String group = await group_file.readAsString();

    final directory3 = await getApplicationDocumentsDirectory();
    final batch_file = File('${directory3.path}/batch_file.txt');
    String batch = await batch_file.readAsString();
   
    print(token);
    print(batch);
    print(group);

    List<Timetable> users = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/timetable/today'));

      request.body = json.encode({"group_no": "${group}", "batch": "${batch}"});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var rs = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        List data = jsonDecode(rs);
        
        for (Map item in data) {
          var group_no = item['group_no'];
          var date = item['date'];
          var start_time = item['start_time'];
          var end_time = item['end_time'];
          var mod_name = item['mod_name'];
          var location = item['location'];
          var begin = item['begin'];
          Timetable user = Timetable(
              group_no, date, start_time, end_time, mod_name, location, begin);
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
    int it = 10;
    int itz = it * 117 + 16;

    return Container(
      child: FutureBuilder(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset("lib/asset/images/loading.json"),
            );
          } else {
            if (snapshot.hasError) {
              return Lottie.asset("lib/asset/images/error.json",
                  width: double.infinity, alignment: Alignment.topCenter);
            } else {
              if (snapshot.data.length == 0) {
                print(snapshot.data);
                return Center(
                    child: Text(
                  ' Today you have not any module',
                  style: text,
                ));
              } else {
                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var time = snapshot.data[index].begin;
                    String tt = time.toString();
                    List<String> dateParts = tt.split(":");
                    var ss = index.toDouble;
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 0, right: 0, left: 0, bottom: 13),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    Text(
                                      snapshot.data[index].start_time
                                          .toString(),
                                      style: third_Heading,
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
                                      snapshot.data[index].location.toString(),
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
                                main_box.copyWith(color: shape_filling_light),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('will start in', style: third_Heading),
                                SizedBox(height: 4),
                                CupertinoPageScaffold(
                                  backgroundColor: shape_filling_dark,
                                  child: TimerCountdown(
                                    spacerWidth: 2,
                                    enableDescriptions: false,
                                    timeTextStyle: timer_text,
                                    colonsTextStyle: timer_weight,
                                    format: CountDownTimerFormat
                                        .hoursMinutesSeconds,
                                    endTime: DateTime.now().add(
                                      Duration(
                                        hours: int.parse(dateParts[0]),
                                        minutes: int.parse(dateParts[1]),
                                        seconds: int.parse(dateParts[2]),
                                      ),
                                    ),
                                    onEnd: () {
                                      print("Timer finished");
                                    },
                                  ),
                                )
                              ],
                            ),
                            width: 90,
                            height: 101,
                            decoration:
                                main_box.copyWith(color: shape_filling_dark),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            }
          }
        },
      ),
      height: itz.toDouble(),
      width: double.infinity,
      decoration: main_box,
    );





    // return Container(
    //   child: ListView.builder(
    //     padding: EdgeInsets.all(16),
    //     physics: NeverScrollableScrollPhysics(),
    //     itemCount: it,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding:
    //             const EdgeInsets.only(top: 0, right: 0, left: 0, bottom: 16),
    //         child: Stack(
    //           alignment: AlignmentDirectional.centerEnd,
    //           children: [
    //             Container(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     'IP Lecture',
    //                     style: heading,
    //                   ),
    //                   Row(
    //                     children: [
    //                       timer,
    //                       SizedBox(
    //                         width: 7,
    //                       ),
    //                       Text(
    //                         '5.00PM',
    //                         style: third_Heading,
    //                       )
    //                     ],
    //                   ),
    //                   Row(
    //                     children: [
    //                       location,
    //                       SizedBox(
    //                         width: 7,
    //                       ),
    //                       Text(
    //                         'main building 4 flow 201',
    //                         style: third_Heading,
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //               padding: EdgeInsets.all(12.0),
    //               height: 101,
    //               width: double.infinity,
    //               decoration: main_box.copyWith(color: shape_filling_light),
    //             ),
    //             Container(
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text('will start in', style: third_Heading),
    //                   SizedBox(height: 4),
    //                   CupertinoPageScaffold(
    //                     backgroundColor: shape_filling_dark,
    //                     child: TimerCountdown(
    //                       spacerWidth: 2,
    //                       enableDescriptions: false,
    //                       timeTextStyle: timer_text,
    //                       colonsTextStyle: timer_weight,
    //                       format: CountDownTimerFormat.hoursMinutesSeconds,
    //                       endTime: DateTime.now().add(
    //                         Duration(
    //                           hours: 0,
    //                           minutes: 10,
    //                           seconds: 34,
    //                         ),
    //                       ),
    //                       onEnd: () {
    //                         print("Timer finished");
    //                       },
    //                     ),
    //                   )
    //                 ],
    //               ),
    //               width: 90,
    //               height: 101,
    //               decoration: main_box.copyWith(color: shape_filling_dark),
    //             )
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    //   height: itz.toDouble(),
    //   decoration: main_box.copyWith(color: shape_filling_white),
    // );
  }
}

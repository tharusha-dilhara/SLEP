import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slep/screen/support_link.dart';

import '../style/style.dart';
import 'button_com.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class secondSupportCom extends StatefulWidget {
  const secondSupportCom({super.key});

  @override
  State<secondSupportCom> createState() => _secondSupportComState();
}

class _secondSupportComState extends State<secondSupportCom> {
  //function start

  Future<List> getsubjectlist() async {
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

    List<List> users = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/timetable/subject_support'));

      request.body = json.encode({"group_no": "${group}", "batch": "${batch}"});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var rs = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        List data = jsonDecode(rs);
        print(data);
        return data;

        // print(data);
      } else {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const aboutus()),
        // );
        print(Future.error.toString());
        return Future.error("error:${response.statusCode}");
      }
    } catch (e) {
      print('error try catch');
      return Future.error(e.toString());
    }
    // print(users);
  }
  //function end

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getsubjectlist(),
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
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: buttonCom(
                    name: snapshot.data[index].toString(),
                    icon_name: 'subject',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => supportLink(
                                mod: '${snapshot.data[index].toString()}',
                                
                              )),
                    );
                  },
                );
              },
            );
          }
        }
      },
    );
  }
}



// return Column(
    //   children: [
    //     GestureDetector(
    //       child: buttonCom(
    //         name: 'ICS',
    //         icon_name: 'subject',
    //       ),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const supportLink()),
    //         );
    //       },
    //     ),
    //     GestureDetector(
    //       child: buttonCom(
    //         name: 'IP',
    //         icon_name: 'subject',
    //       ),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const supportLink()),
    //         );
    //       },
    //     ),
    //     GestureDetector(
    //       child: buttonCom(
    //         name: 'CS',
    //         icon_name: 'subject',
    //       ),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const supportLink()),
    //         );
    //       },
    //     ),
    //     GestureDetector(
    //       child: buttonCom(
    //         name: 'IP',
    //         icon_name: 'subject',
    //       ),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => const supportLink()),
    //         );
    //       },
    //     ),
    //   ],
    // )
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'dart:io';

import '../Components/alert_com.dart';
import '../Components/back_button.dart';
import '../Components/button_com.dart';
import '../const/colors.dart';
import '../style/style.dart';

class alert extends StatefulWidget {
  const alert({super.key});

  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  Future<List> getalert() async {
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
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/notification/group'));

      request.body = json.encode({
        "group_no": "${group}",
        "batch": "${batch}",
      });

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getalert();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34, bottom: 12, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              s_12,
              FutureBuilder(
                  future: getalert(),
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
                              child: alertCom(
                                name: snapshot.data[index].toString(),
                                icon_name: 'alert',
                              ),
                              
                            );
                          },
                        );
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

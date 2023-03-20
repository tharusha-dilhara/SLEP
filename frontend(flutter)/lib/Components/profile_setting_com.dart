import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slep/screen/support_link.dart';

import '../style/style.dart';
import 'button_com.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class profileSettingCon extends StatefulWidget {
  const profileSettingCon({super.key});

  @override
  State<profileSettingCon> createState() => _profileSettingConState();
}

class _profileSettingConState extends State<profileSettingCon> {
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

    List<String> users = [];
    try {
      var headers = {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/user'));

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
      return Future.error(e.toString());
    }
    // print(users);
  }
  //function end

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        decoration: main_box,
        width: double.infinity,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Lottie.asset("lib/asset/images/pf1.json",
                height: 150, width: 150),
          ),
          FutureBuilder(
                  future: getsubjectlist(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text(
                          'loading',
                          style: heading,
                        ),
                      );
                    } else {
                      return Container(
                        width: 200,
                        height: 200,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Text(snapshot.data[index].toString(),style: text,);
                          },
                        ),
                      );
                    }
                  },
                )
        ]));
  }
}








// Container(
//       width: double.infinity,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             child: Lottie.asset("lib/asset/images/pf1.json",
//                 height: 150, width: 150),
//           ),
//           Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

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

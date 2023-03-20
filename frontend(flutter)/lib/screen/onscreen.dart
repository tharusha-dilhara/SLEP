import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sembast/sembast_io.dart';
import 'package:slep/const/colors.dart';
import 'package:slep/main.dart';
import 'package:slep/screen/singin.dart';
import 'package:slep/style/style.dart';
import 'package:http/http.dart' as http;

import 'package:sembast/sembast.dart';

import 'package:path_provider/path_provider.dart';

class onscreen extends StatefulWidget {
  const onscreen({super.key});

  @override
  State<onscreen> createState() => _onscreenState();
}

class _onscreenState extends State<onscreen> {
  // File path to a file in the current directory

  String dbPath = 'sample.db';
  DatabaseFactory dbFactory = databaseFactoryIo;

  var rs = Text('Loading..', style: text.copyWith(color: shape_filling_white));

  // _save() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/my_file.txt');
  //   final text = '5|QjBqCRfVVyhtNxgseaitTRKhUmotzqh4w1r1E';
  //   await file.writeAsString(text);
  //   print('saved');
  // }

  // _read() async {
  //   try {
  //     final directory = await getApplicationDocumentsDirectory();
  //     final file = File('${directory.path}/my_file.txt');
  //     String text = await file.readAsString();
  //     print(text);
  //     return text.toString();
  //   } catch (e) {
  //     print("Couldn't read file");
  //   }
  // }

  Future auth() async {
    // await _save();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    bool doesFileExists = await file.exists();
    if (!doesFileExists) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const singin()),
      );
    }
    String token = await file.readAsString();
    if (token == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const singin()),
      );
    }

    print(token);

    final response = await http.get(
      Uri.parse(
          'http://v1slepapi-env.eba-qhrjeqqn.ap-northeast-1.elasticbeanstalk.com/api/user'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      
      
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/roles.txt');
        final text = data[0].toString();
        await file.writeAsString(text);

          print('api login');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const mainpage()),
      );
    } else {
      print('api login faild');
      setState(() {
        rs = Text("login failed please try again sign up or login",
            style: text.copyWith(color: Colors.red));
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const singin()),
      );
    }
  }

  @override
  void initState() {
    auth();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shape_filling_dark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SLEP',
              style: heading.copyWith(fontSize: 45),
            ),
            Text(
              'Student Learing Easiest Platform',
              style: text.copyWith(
                  fontSize: 10, letterSpacing: 1, color: shape_filling_white),
            ),
            s_12,
            s_12,
            s_12,
            Transform.scale(
              scale: 0.5,
              child: CircularProgressIndicator(
                  color: shape_filling_light, strokeWidth: 3),
            ),
            s_12,
            s_12,
            s_12,
            rs
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:slep/Components/top_weekdayCom.dart';
import 'package:slep/Components/weektimatable_com.dart';
import 'package:slep/style/style.dart';

import '../Components/back_button.dart';
import '../Components/top_support_com.dart';
import '../Components/top_weektimatableCom.dart';



class weektimatable extends StatefulWidget {
  final  date;
  const weektimatable({super.key,@required this.date});

  @override
  State<weektimatable> createState() => _weektimatableState();
}

class _weektimatableState extends State<weektimatable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34,bottom: 16,left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              s_12,
              topweektimatableCom(),
              weektimatablecom(date: '${widget.date.toString()}')
              
            ],
          ),
        ),
      ),
    );
  }
}
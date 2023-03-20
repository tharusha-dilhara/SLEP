import 'package:flutter/material.dart';
import '../Components/second_support_com.dart';
import '../Components/top_support_com.dart';


class support extends StatefulWidget {
  const support({super.key});

  @override
  State<support> createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34,bottom: 16,left: 16,right: 16),
          child: Column(
            children: [topSupportCom(), secondSupportCom()],
          ),
        ),
      ),
    );
  }
}

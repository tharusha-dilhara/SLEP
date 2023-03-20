import 'package:flutter/material.dart';

import 'package:slep/Components/top_main_com.dart';
import 'package:slep/style/style.dart';
import 'package:rive/rive.dart';


import '../Components/second_main_com.dart';







class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}


 

class _homeState extends State<home> {


  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 34,bottom: 16,left: 16,right: 16),
          child: Column(
            children: [
              topMainCom(),
              SizedBox(
                height: 15,
              ),
              scondMainCom(),

              
              
              
            ],
          ),
        ),
      ),
    );
  }
}

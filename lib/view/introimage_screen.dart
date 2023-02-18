import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Introimage_screen extends StatefulWidget {
  const Introimage_screen({Key? key}) : super(key: key);

  @override
  State<Introimage_screen> createState() => _Introimage_screenState();
}

class _Introimage_screenState extends State<Introimage_screen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset("assets/image/01_5_Dark_ad_splash screen.png",),
          Padding(
            padding:  EdgeInsets.only(top: 4.h,right: 1.w),
            child: Container(
              height: 6.h,
              width: 6.h,
              decoration: BoxDecoration(color: Colors.white30,
              shape: BoxShape.circle),
              child: InkWell(onTap: (){
                Navigator.pushReplacementNamed(context,'interest');
              },child: Center(child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 20),))),
            ),
          ),
        ],
      ),
    );
  }

  int time(int sec){
    int sec = 5;
    return sec;
  }

}

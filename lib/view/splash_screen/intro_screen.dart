import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/model/ads_screen.dart';

class Intro_Scrren extends StatefulWidget {
  const Intro_Scrren({Key? key}) : super(key: key);

  @override
  State<Intro_Scrren> createState() => _Intro_ScrrenState();
}

class _Intro_ScrrenState extends State<Intro_Scrren> {
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(
         body: PageView(
           scrollDirection: Axis.horizontal,
           children: [
             Container(
               color: Colors.black,
               child: Image.asset("assets/image/01_2_Dark_walkthrough 2.png",height: 100.h,width: 100.w,),
             ),
             Container(
               color: Colors.black,
               child: Image.asset("assets/image/01_3_Dark_walkthrough 3.png",height: 100.h,width: 100.w,),
             ),
             Container(
               color: Colors.black,
               child: Stack(
                 alignment: Alignment.bottomCenter,
                 children: [
                   Image.asset("assets/image/01_4_Dark_walkthrough 4.png",height: 100.h,width: 100.w,),
                   InkWell(
                     onTap: (){
                       interVideoAds();
                       setState(() {
                         isloading=true;
                       });
                       Timer(Duration(seconds: 3), () {
                         setState(() {
                           isloading=false;
                         });
                         Navigator.pushReplacementNamed(context,'inima');
                       });
                     },
                     child: Padding(
                       padding:  EdgeInsets.only(bottom:5.h),
                       child: Container(
                         height: 8.h,
                         width:90.w,
                         decoration: BoxDecoration(
                           color: Color(0xFFFF4D67),
                           borderRadius: BorderRadius.circular(30.sp),
                         ),
                         child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 15),)),
                       ),
                     ),
                   ),
                   isloading?Center(child: Lottie.asset("assets/lottie/129489-heart-filled (1).json",width: 20.h,height: 20.h,fit: BoxFit.fill)):Container()
                 ],
               ),
             ),
           ],
         ),
      ),
    );
  }
}

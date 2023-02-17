import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Intro_Scrren extends StatefulWidget {
  const Intro_Scrren({Key? key}) : super(key: key);

  @override
  State<Intro_Scrren> createState() => _Intro_ScrrenState();
}

class _Intro_ScrrenState extends State<Intro_Scrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: PageView(
         scrollDirection: Axis.horizontal,
         children: [
           Container(
             color: Colors.red,
             child: Image.asset("assets/image/01_2_Dark_walkthrough 2.png",height: 100.h,width: 100.w,),
           ),
           Container(
             color: Colors.deepPurple,
             child: Image.asset("assets/image/01_3_Dark_walkthrough 3.png",height: 100.h,width: 100.w,),
           ),
           Container(
             color: Colors.red,
             child: Stack(
               alignment: Alignment.bottomCenter,
               children: [
                 Image.asset("assets/image/01_4_Dark_walkthrough 4.png",height: 100.h,width: 100.w,),
                 InkWell(
                   onTap: (){
                     
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
               ],
             ),
           ),
         ],
       ),
    );
  }
}

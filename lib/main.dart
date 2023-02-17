import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/provider/provider_class.dart';
import 'package:video_meet/view/fast_timescreen.dart';
import 'package:video_meet/view/splash_screen/intro_screen.dart';
import 'package:video_meet/view/splash_screen/splash_screen.dart';

void main(){
   runApp(
     MultiProvider(
       providers: [
         ListenableProvider(create: (context)=>Home_Provider()),
       ],
       child: Sizer(
         builder: (context, orientation, deviceType){
           return  MaterialApp(
             debugShowCheckedModeBanner: false,
             routes: {
               '/':(context)=>Splash_Screen(),
               'first':(contest)=>First_TimeScrren(),
               'intro':(context)=>Intro_Scrren(),
             },
           );
         },
       ),
     ),
   );
}
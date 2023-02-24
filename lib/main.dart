import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/provider/provider_class.dart';
import 'package:video_meet/view/Choose_Your_Interest_screen.dart';
import 'package:video_meet/view/Video/tabbar_video.dart';
import 'package:video_meet/view/Video/video_screen.dart';
import 'package:video_meet/view/bottom_barscreen.dart';
import 'package:video_meet/view/demo_screen.dart';
import 'package:video_meet/view/notification.dart';
import 'package:video_meet/view/fast_timescreen.dart';
import 'package:video_meet/view/introimage_screen.dart';
import 'package:video_meet/view/splash_screen/intro_screen.dart';
import 'package:video_meet/view/splash_screen/splash_screen.dart';
import 'package:video_meet/view/yourself_screen.dart';

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
            initialRoute: 'bottom',
             routes: {
               '/':(context)=>Splash_Screen(),
               'first':(contest)=>First_TimeScrren(),
               'intro':(context)=>Intro_Scrren(),
               'inima':(context)=>Introimage_screen(),
               'interest':(context)=>Choose_Your_Interest_Screen(),
               'yourself':(contest)=>Yourself_Screen(),
               'notification':(context)=>Notification_screen(),
               'bottom':(context)=>Bottom_Screen(),
               'tab':(context)=>Tabarvideo_Screen(),
               'fvideo':(contxt)=>Video_Screen(),

               'd':(context)=>MyHomePage(),
             },
           );
         },
       ),
     ),
   );
}
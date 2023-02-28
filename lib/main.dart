import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/provider/provider_class.dart';
import 'package:video_meet/view/Choose_Your_Interest_screen.dart';
import 'package:video_meet/view/Video/newVideo_screen.dart';
import 'package:video_meet/view/Video/tabbar_video.dart';
import 'package:video_meet/view/Video/video_screen.dart';
import 'package:video_meet/view/Video/videoplay_screen.dart';
import 'package:video_meet/view/best_videoscreen/Best_Video_Screen.dart';
import 'package:video_meet/view/best_videoscreen/best_videoplay_screen.dart';
import 'package:video_meet/view/best_videoscreen/trendingvideo_Screen.dart';
import 'package:video_meet/view/bottom_barscreen.dart';
import 'package:video_meet/view/location_screen/deatail_screen.dart';
import 'package:video_meet/view/location_screen/location_screen.dart';
import 'package:video_meet/view/notification.dart';
import 'package:video_meet/view/fast_timescreen.dart';
import 'package:video_meet/view/introimage_screen.dart';
import 'package:video_meet/view/profile/Profile_screen.dart';
import 'package:video_meet/view/splash_screen/intro_screen.dart';
import 'package:video_meet/view/splash_screen/splash_screen.dart';
import 'package:video_meet/view/terms_screen.dart';
import 'package:video_meet/view/yourself_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();//Add this
  await FaceCamera.initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(
     MultiProvider(
       providers: [
         ListenableProvider(create: (context)=>Home_Provider()),
       ],
       child: Sizer(
         builder: (context, orientation, deviceType){
           return  MaterialApp(
             debugShowCheckedModeBanner: false,
           // initialRoute: 'bottom',
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
               'videoplay':(context)=>VideoPlay_Screen(),
               'nvideo':(context)=>Newvideo_Screen(),
               'bvideo':(context)=>BestVideo_Screen(),
               'location':(context)=>Location_Screen(),
               'detail':(context)=>Detail_screen(),
               'profile':(context)=>Profile_Screen(),
               'bplay':(context)=>Best_Videoplay_Screen(),
               'tvideo':(context)=>Trending_video_Screen(),
               'terms':(context)=>Terms_Screen(),
             },
           );
         },
       ),
     ),
    )
   );
}
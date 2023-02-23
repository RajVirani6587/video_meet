import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';


class First_TimeScrren extends StatefulWidget {
  const First_TimeScrren({Key? key}) : super(key: key);

  @override
  State<First_TimeScrren> createState() => _First_TimeScrrenState();
}

class _First_TimeScrrenState extends State<First_TimeScrren> {
   VideoPlayerController ? videoPlayerController;


   @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset("assets/video/vv.mp4")
     ..initialize().then((value) {
     setState(() {
       videoPlayerController!.setLooping(true);
       videoPlayerController!.play();
       videoPlayerController!.setVolume(0.0);
         });
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              Container(
                height:100.h,
                width:100 .w,
                child:videoPlayerController!.value.isInitialized ?
                AspectRatio(
                    aspectRatio: videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(videoPlayerController!)) :
                Center(child: const CircularProgressIndicator(color: Colors.green,)),
              ),
              Opacity(opacity: 0.6,child: Container(color: Color(0xFFFF4D67),height: 100.h,width: 100.w,)),
            ],
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,'intro');
            },
            child: Container(
              height: 40.h,
              width: 100.w,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 4.h,),
                   Text("Meet",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 50.sp,fontWeight: FontWeight.bold),),
                  SizedBox(height: 2.h,),
                  Container(
                    height: 8.h,
                  width: 85.w,
                  child: Center(child: Text("Fast Time",style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),)),
                  decoration: BoxDecoration(color: Color(0xFFFF4D67),borderRadius: BorderRadius.circular(8.sp)),
                  ),
                  SizedBox(height: 2.h,),
                  privacyPolicyLinkAndTermsOfService(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
   Widget privacyPolicyLinkAndTermsOfService() {
     return Container(
       alignment: Alignment.center,
       padding: EdgeInsets.all(10),
       child: Center(
           child: Text.rich(
               TextSpan(
                   text: 'By Signing in you agree to', style: TextStyle(
                   fontSize: 15.sp, color: Colors.black
               ),
                   children: <TextSpan>[
                     TextSpan(
                         text: ' privacy policy', style: TextStyle(
                       fontSize: 15.sp, color: Colors.black,
                       fontWeight: FontWeight.bold
                     ),
                         recognizer: TapGestureRecognizer()
                           ..onTap = () {
                           }
                     ),
                     TextSpan(
                         text: ' and ', style: TextStyle(
                         fontSize: 15.sp, color: Colors.black
                     ),
                         children: <TextSpan>[
                           TextSpan(
                               text: 'terms of use.', style: TextStyle(
                               fontSize: 15.sp, color: Colors.black,
                               fontWeight: FontWeight.bold
                           ),
                               recognizer: TapGestureRecognizer()
                                 ..onTap = () {
                                 }
                           )
                         ]
                     )
                   ]
               )
           )
       ),
     );
   }
}

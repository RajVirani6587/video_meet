import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/provider/provider_class.dart';
import 'package:video_player/video_player.dart';

class Trending_video_Screen extends StatefulWidget {
  const Trending_video_Screen({Key? key}) : super(key: key);

  @override
  State<Trending_video_Screen> createState() => _Trending_video_ScreenState();
}

class _Trending_video_ScreenState extends State<Trending_video_Screen> {
  late VideoPlayerController video_controller;
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  @override
  void initState() {
    super.initState();
    video_controller = VideoPlayerController.asset("assets/video/25.mp4")
      ..initialize().then((value) {
        setState(() {
          video_controller.setLooping(true);
          video_controller.play();
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return WillPopScope(
      onWillPop: dialog,
      child: Scaffold(
        body: Builder(
          builder:(context){
            return  Stack(
              alignment: Alignment.bottomRight,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.h,
                      width: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: video_controller.value.isInitialized
                            ?
                        AspectRatio(
                            aspectRatio: video_controller.value.aspectRatio,
                            child: VideoPlayer(video_controller))
                            :
                        Center(child: const CircularProgressIndicator(color: Colors.green,)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h,left: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(borderRadius: BorderRadius.circular(60.sp),child: Image.asset("assets/image/Image-1.png",height: 7.h,width: 7.h,fit: BoxFit.fill,)),
                          SizedBox(width: 4.w,),
                          Text("Olivia",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.sp),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 1.w),
                        child: InkWell(onTap: (){
                          Navigator.pushNamed(context,'bottom');
                          dialog();
                        },child: Icon(Icons.close,size: 30.sp,color: Colors.transparent,)),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
  Future<bool> dialog() async {
    home_providerf!.playpause();
    video_controller.pause();
    back();
    return await false;
  }

  void back(){
    Navigator.pushNamed(context, 'bottom');
  }
}

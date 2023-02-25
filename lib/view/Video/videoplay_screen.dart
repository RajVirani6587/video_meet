import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_meet/provider/provider_class.dart';
import 'package:video_player/video_player.dart';

class VideoPlay_Screen extends StatefulWidget {
  const VideoPlay_Screen({Key? key}) : super(key: key);

  @override
  State<VideoPlay_Screen> createState() => _VideoPlay_ScreenState();
}

class _VideoPlay_ScreenState extends State<VideoPlay_Screen> {
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  late VideoPlayerController video_controller;

  @override
  void initState() {
    super.initState();
    print("-----------------------------------------------${Provider.of<Home_Provider>(context,listen: false).Datapickkk!.video}");
    video_controller = VideoPlayerController.asset("${Provider.of<Home_Provider>(context,listen: false).Datapickkk!.video}")
      ..initialize().then((value) {
        setState(() {
          video_controller.setLooping(true);
          video_controller.play();
        });
      });
  }
  File? _capturedImage;
  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return WillPopScope(
      onWillPop:dialog,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*1,
                      width: MediaQuery.of(context).size.width*0.99,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: video_controller.value.isInitialized
                              ?
                          AspectRatio(
                              aspectRatio: video_controller.value.aspectRatio,
                              child: VideoPlayer(video_controller))
                              :
                          Center(child: const CircularProgressIndicator(color: Colors.green,))
                      ),
                    ),
                  ],
                ),
                Text("${home_providerf!.Datapickkk!.flag}"),
              ],
            ),
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
    Navigator.pushReplacementNamed(context, 'bottom');
  }
}

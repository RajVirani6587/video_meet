import 'dart:io';

import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
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
          body:Builder(builder:(context){
            if (_capturedImage != null) {
              return Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.file(_capturedImage!),
                  ],
                ),
              );
            }
           return  Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100.h,
                        width: 99.w,
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.27,
                      width: MediaQuery.of(context).size.width*0.35,
                      child: SmartFaceCamera(
                        showFlashControl: false,
                        showControls: false,
                        defaultCameraLens: CameraLens.front,
                        onCapture: (File? image)  {
                          _capturedImage = image;
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          floatingActionButton: Padding(
            padding: const  EdgeInsets.only(bottom: 5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width*0.15,
                height: MediaQuery.of(context).size.height*0.15,
                child: FloatingActionButton(
                  onPressed: (){
                    dialog();
                  },
                  child: Icon(Icons.call,size: 40,),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
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

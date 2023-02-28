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
             alignment: Alignment.bottomLeft,
             children: [
               Stack(
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
                  ),
               Padding(
                 padding: EdgeInsets.only(bottom: 5.h),
                 child: PopupMenuButton(
                     initialValue: 2,
                     icon: Icon(Icons.more_vert,color: Colors.white,size: 25.sp,),
                     itemBuilder: (context)=>[
                       PopupMenuItem(child: InkWell(onTap: (){reportsheetdilaog();},child: Text("Report"))),
                       PopupMenuItem(child: InkWell(onTap: (){
                         showDialog(
                           context: context,
                           builder: (BuildContext context){
                             return Expanded(
                               child: AlertDialog(
                                 title: Text('Block Video',style: TextStyle(color: Colors.red),),
                                 content: Text('Block Video Please Enter Block.'),
                                 actions: [
                                   InkWell(onTap:(){
                                     dialog();
                                   },
                                     child: Padding(
                                       padding: EdgeInsets.all(8.0),
                                       child: Container(
                                         child: Text("Block",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             );
                           },
                         );
                       },child: Text("Block ",))),
                     ]
                 ),
               ),
             ],
           );
         },

          ),
          floatingActionButton:
          Padding(
            padding: const  EdgeInsets.only(bottom: 5),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 8.h,
                height: 8.h,
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

  void reportsheetdilaog(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context:context,
        builder:(context){
          return Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), color: Colors.black,),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical:1.5.h),
                        child: Container(height:0.5.h,width: 18.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey,),),
                      ),
                    ),
                    Align(alignment: Alignment.center,child: Text("Report",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18.sp),)),
                    SizedBox(height: 1.h,),
                    Text("Why are you reporting this post?",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),),
                    SizedBox(height: 1.h,),
                    Text("Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",style: TextStyle(color: Colors.white60),),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){

                    },child: Text("I just don't like it",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){
                      dialog();
                    },child: Text("it's spam",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){
                      dialog();
                    },child: Text("Nudity or sexual activity",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Hate speech or symbols",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Violence or dangerous organisations",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("False information",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Bullying or harassment",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Scam or fraud",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Intellectual property violation",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Suicide or self-injury",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Sale of illegal or regulated goods",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                    SizedBox(height: 1.h,),
                    InkWell(onTap: (){dialog();},child: Text("Eating disorders",style: TextStyle(color: Colors.white,fontSize:15.sp,fontWeight: FontWeight.w500 ),)),
                  ],
                ),
              ),
            ),
          );
        }
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

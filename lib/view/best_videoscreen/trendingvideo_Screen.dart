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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right:1.w,bottom: 8.h),
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
    Navigator.pushNamed(context, 'bottom');
  }
}

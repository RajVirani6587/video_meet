import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/model/ads_screen.dart';
import 'package:video_meet/model/model_class.dart';
import 'package:video_meet/provider/provider_class.dart';

class BestVideo_Screen extends StatefulWidget {
  const BestVideo_Screen({Key? key}) : super(key: key);

  @override
  State<BestVideo_Screen> createState() => _BestVideo_ScreenState();
}

class _BestVideo_ScreenState extends State<BestVideo_Screen> {
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body:Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 30.h,
                centerTitle: false,
                floating: true,
                pinned: true,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding:  EdgeInsets.only(top: 10.h),
                    child: Row(
                    children: [
                       InkWell(onTap: (){
                         interVideoAds();
                         setState(() {
                           isloading=true;
                         });
                         Timer(Duration(seconds: 4), () {
                           setState(() {
                             isloading=false;
                           });
                           Navigator.pushNamed(context,'tvideo');
                         });

                       },child: Image.asset("assets/image/B-1.png",height: 17.h,width: 17.h,fit: BoxFit.fill,)),
                        SizedBox(width:4.w),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Favorite Girl by\nThis Month",style: TextStyle(color: Colors.white, fontSize: 18.sp,fontWeight: FontWeight.bold),),
                              SizedBox(height:2.h),
                              Text("387.5M view",style: TextStyle(color: Colors.white70),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                title: Text("Trending Video",style: TextStyle(color: Colors.white,fontSize:18.sp),),

              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,mainAxisExtent: 23.h),
                delegate: SliverChildBuilderDelegate(
                  childCount: home_providerf!.l1.length,
                      (context,index){
                    return  Padding(
                           padding:  EdgeInsets.all(3.sp),
                           child: InkWell(
                             onTap: (){
                               interVideoAds();
                               setState(() {
                                 isloading=true;
                               });
                               Timer(Duration(seconds: 4), () {
                                 setState(() {
                                   isloading=false;
                                 });
                                 home_providerf!.Datapickkk = Model(
                                   TImage: home_providerf!.l1[index].TImage,
                                   like: home_providerf!.l1[index].like,
                                   Image2: home_providerf!.l1[index].Image2,
                                   flag: home_providerf!.l1[index].flag,
                                   centry:home_providerf!.l1[index].centry,
                                   con: home_providerf!.l1[index].con,
                                   Image: home_providerf!.l1[index].Image,
                                   km:   home_providerf!.l1[index].km,
                                   Name: home_providerf!.l1[index].Name,
                                   year: home_providerf!.l1[index].year,
                                   video:home_providerf!.l1[index].video,
                                 );
                                 Navigator.pushNamed(context, 'bplay');
                               });
                             },
                             child: Container(
                               height:30.h,
                               width: 48.w,
                               decoration: BoxDecoration(
                                   color: Colors.black,
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Stack(
                                 alignment: Alignment.center,
                                 children: [
                                   Stack(
                                     children: [
                                       ClipRRect(borderRadius: BorderRadius.circular(10.sp),
                                         child: Image.asset("${home_providerf!.l1[index].TImage}",
                                           fit: BoxFit.fill,
                                           height:22.h,
                                           width: 48.w,
                                         ),
                                       ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0.sp),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Row(
                                               children: [
                                                 Image.asset("assets/image/Exclude (1).png",height: 2.5.h,width: 2.5.h,fit: BoxFit.fill,),
                                                 SizedBox(width:2.w),
                                                 Text("${home_providerf!.l1[index].like}k",style: TextStyle(color: Colors.white),)
                                          ],
                                        )),
                                      ),
                                     ],
                                   ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                        Image.asset("assets/image/icon.png",height: 5.h,width: 5.h,fit: BoxFit.fill,)
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         );

                  },
                ),


              ),
            ],

          ),
          isloading?Center(child: Lottie.asset("assets/lottie/129489-heart-filled (1).json",width: 20.h,height: 20.h,fit: BoxFit.fill)):Container()

        ],
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/const/conts.dart';
import 'package:video_meet/model/ads_screen.dart';
import 'package:video_meet/provider/provider_class.dart';

class Detail_screen extends StatefulWidget {
  const Detail_screen({Key? key}) : super(key: key);

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  NativeAd? nativead;
  bool isAdLoaded = false;
  bool isloading=false;
  @override
  void initState() {
    super.initState();
    nat();
  }
  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return WillPopScope(
      onWillPop: ()async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                   Container(
                     height: 50.h,
                     width: 100.w,
                     child: Image.asset("${home_providerf!.Datapickkk!.Image}",height: 50.h,width: 100.w,fit: BoxFit.fill,),
                   ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 3.w),
                            child: InkWell(onTap: (){
                              Navigator.pushNamed(context,'bottom');
                            },child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20.sp,)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Text("🟢 ${home_providerf!.Datapickkk!.Name}❤ヾ",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w700),),
                  ),
                ),
                SizedBox(height: 1.h,),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.female,color: Color(0xFFFF4D67),size: 20.sp,),
                        Text("${home_providerf!.Datapickkk!.year}",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 12.sp,),),
                      ],
                    ),
                    SizedBox(width: 6.w,),
                    Row(
                      children: [
                        Container(height: 3.h,width: 3.h,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.sp),color: Colors.white),child: Center(child: Text("Id",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),),),),
                        SizedBox(width: 2.w,),
                        Text("8001398",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 12.sp,),),
                      ],
                    ),
                    SizedBox(width: 6.w,),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.white,),
                        SizedBox(width: 2.w,),
                        Text("${home_providerf!.Datapickkk!.con}",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 12.sp,),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Speaking language',style: TextStyle(color: Colors.white,fontSize: 17.sp,fontWeight: FontWeight.bold),),
                        SizedBox(height: 1.h,),
                        Container(height: 4.h,width: 20.w,child: Center(child: Text("English",style: TextStyle(color: Colors.white),)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp),color: Colors.white24),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.5.h,),
                isAdLoaded ?
                Container(
                  height:18.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  child: AdWidget(ad: nativead!),
                ) :
                Container(
                    height:18.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()
                ),
                SizedBox(height: 1.5.h,),
                InkWell(onTap: (){
                  interVideoAds();
                  setState(() {
                    isloading=true;

                  });
                  Timer(Duration(seconds: 4), () {
                    setState(() {
                      isloading=false;
                    });
                    Navigator.pushReplacementNamed(context,'videoplay');
                  });

                },child: Image.asset("assets/image/Group 37.png",height: 7.h,width: 7.h,fit: BoxFit.fill,))
              ],
            ),
            isloading?Center(child: Lottie.asset("assets/lottie/129489-heart-filled (1).json",width: 20.h,height: 20.h,fit: BoxFit.fill)):Container()
          ],
        ),
      ),
    );
  }
  void nat(){
    try
    {
      nativead = NativeAd(
        adUnitId: '$na',
        factoryId: 'listTile',
        request: const AdRequest(),
        listener: NativeAdListener(
            onAdLoaded: (_) {
              setState(() {
                isAdLoaded = true;
              });
            },
            onAdFailedToLoad: (ad, error) {
              nat();

            }),
      );
      nativead!.load();
    }
    on Exception
    {}
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/const/conts.dart';
import 'package:video_meet/model/ads_screen.dart';

class Introimage_screen extends StatefulWidget {
  const Introimage_screen({Key? key}) : super(key: key);

  @override
  State<Introimage_screen> createState() => _Introimage_screenState();
}

class _Introimage_screenState extends State<Introimage_screen> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset("assets/image/01_5_Dark_ad_splash screen.png",),
          Padding(
            padding:  EdgeInsets.only(top: 4.h,right: 1.w),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 6.h,
                    width: 6.h,
                    decoration: BoxDecoration(color: Colors.white30,
                    shape: BoxShape.circle),
                    child: InkWell(onTap: (){
                      interVideoAds();
                      setState(() {
                        isloading=true;
                      });
                      Timer(Duration(seconds: 4), () {
                        setState(() {
                          isloading=false;
                        });
                        Navigator.pushReplacementNamed(context,'interest');
                      });

                    },child: Center(child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 20),))),
                  ),
                ),
                isAdLoaded ?
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height:18.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    child: AdWidget(ad: nativead!),
                  ),
                ) :
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height:18.h,
                      width: 100.w,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()
                  ),
                ),
              ],
            ),
          ),
          isloading?Center(child: Lottie.asset("assets/lottie/129489-heart-filled (1).json",width: 20.h,height: 20.h,fit: BoxFit.fill)):Container()
        ],
      ),
    );
  }

  int time(int sec){
    int sec = 5;
    return sec;
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

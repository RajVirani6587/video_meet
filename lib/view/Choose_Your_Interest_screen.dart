import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/const/conts.dart';
import 'package:video_meet/model/ads_screen.dart';

class Choose_Your_Interest_Screen extends StatefulWidget {
  const Choose_Your_Interest_Screen({Key? key}) : super(key: key);

  @override
  State<Choose_Your_Interest_Screen> createState() => _Choose_Your_Interest_ScreenState();
}

class _Choose_Your_Interest_ScreenState extends State<Choose_Your_Interest_Screen> {
  int cnt = 0;
  Color c1= Color(0xFFFFFFFF);
  bool value1 = false;
  @override
  void initState() {
    super.initState();
    nat();
  }
  NativeAd? nativead;
  bool isAdLoaded = false;
  bool isloading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:  EdgeInsets.only(top: 3.h),
        child: Stack(
          children: [
            Column(
              children: [
                 ListTile(leading: Text("Choose Your Interest",style: TextStyle(color: Colors.white,fontSize: 15.sp),)),
                 SizedBox(height: 1.h,),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 3.w),
                   child: Text("Choose your interests and get the best video recommendations.",style: TextStyle(color: Colors.white),),
                 ),
                SizedBox(height: 1.h,),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Entertainment",
                              0,
                          ),
                          Selecte(
                              "Gaming",
                              1,

                          ),

                        ],
                      ),
                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Art",
                              2,),
                          Selecte(
                              "Animals ",
                              3),
                          Selecte(
                              "Comedy ",
                              4),

                        ],
                      ),
                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Dance",
                              5),
                          Selecte(
                              "Beauty", 6),
                          Selecte(
                              "Music",
                              7),

                        ],
                      ),
                      SizedBox(height:  1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Food & Drink",
                              8),
                          Selecte(
                              "Sports",
                              9),
                          Selecte(
                              "DIY",
                              10),

                        ],
                      ),
                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Science & Education",
                              11),
                          Selecte(
                              "Travel ",
                              12),

                        ],
                      ),
                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Family ",
                              13),
                          Selecte(
                              "Anime & Movie", 14),
                        ],
                      ),
                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Technology",
                              15),
                          Selecte(
                              "Outdoors",
                              16),
                        ],
                      ),
                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selecte(
                              "Culture",
                              17),
                          Selecte(
                              "Health",
                              18),
                          Selecte(
                              "Comics",
                              19),
                        ],
                      ),
                      SizedBox(height: 1.h,),
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
                      SizedBox(height: 1.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){
                              interVideoAds();
                              setState(() {
                                isloading=true;
                              });
                              Timer(Duration(seconds: 4), () {
                                setState(() {
                                  isloading=false;
                                });
                                Navigator.pushNamed(context,'yourself');
                              });
                            },
                            child: Container(
                              height: 7.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  color: Colors.white30,
                                  borderRadius: BorderRadius.circular(20.sp)
                              ),
                              child: Center(child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              interAds();
                              setState(() {
                                isloading=true;
                              });
                              Timer(Duration(seconds: 2), () {
                                setState(() {
                                  isloading=false;
                                });
                                Navigator.pushNamed(context,'yourself');
                              });

                            },
                            child: Container(
                              height: 7.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF4D67),
                                  borderRadius: BorderRadius.circular(20.sp)
                              ),
                              child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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

  Widget Selecte(String text, int i) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.sp,color: Color(0xFFFF4D67)),
          backgroundColor: cnt == i ? Color(0xFFFF4D67) : Colors.black,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
        ),
        onPressed: () {
          setState(() {
            cnt = i;
          });
        },
        child: Text(
          "$text",
          style: TextStyle(fontSize: 15.sp,color:cnt == i?  Colors.white : Color(0xFFFF4D67)),
        ),
    );
  }
}

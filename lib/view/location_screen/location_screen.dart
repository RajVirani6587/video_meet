import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/const/conts.dart';
import 'package:video_meet/model/ads_screen.dart';
import 'package:video_meet/model/model_class.dart';
import 'package:video_meet/provider/provider_class.dart';

class Location_Screen extends StatefulWidget {
  const Location_Screen({Key? key}) : super(key: key);

  @override
  State<Location_Screen> createState() => _Location_ScreenState();
}

class _Location_ScreenState extends State<Location_Screen> {
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  bool isloading=false;
  bool isAdLoaded = false;


  @override
  void initState() {
    super.initState();
    nat();
  }
  NativeAd? nativead;
  @override
  Widget build(BuildContext context) {


    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 5.h,),
              Align(
                alignment: Alignment.center ,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:15.h),
                  child: Text("Nearby",style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700),),
                ),
              ),
              SizedBox(height: 3.h,),
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
              Expanded(
                child: ListView.builder(
                  itemCount: home_providerf!.l1.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding:  EdgeInsets.symmetric(vertical: 1.5.h),
                        child: InkWell(
                          onTap: (){
                            interAds();
                            setState(() {
                              isloading=true;
                            });
                            Timer(Duration(seconds: 3), () {
                              setState(() {
                                isloading=false;
                              });
                              home_providerf!.Datapickkk = Model(
                                con: home_providerf!.l1[index].con,
                                Image: home_providerf!.l1[index].Image,
                                km:   home_providerf!.l1[index].km,
                                Name: home_providerf!.l1[index].Name,
                                year: home_providerf!.l1[index].year,
                                video:home_providerf!.l1[index].video,
                              );
                              Navigator.pushNamed(context, 'detail');
                            });

                          },
                          child: ListTile(
                            leading: ClipRRect(borderRadius: BorderRadius.circular(60.sp),child: Image.asset("${home_providerf!.l1[index].Image}",height: 10.h,width: 7.h,fit: BoxFit.fill,)),
                            title: Text("${home_providerf!.l1[index].Name},${home_providerf!.l1[index].year}",style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w700),),
                            subtitle:Padding(
                              padding:  EdgeInsets.only(top: 1.5.h),
                              child: Wrap(
                                children: [
                                  Icon(Icons.location_on_outlined,color: Colors.white70,size: 12.sp,),
                                  Text("${home_providerf!.l1[index].km}",style: TextStyle(color: Colors.white70),),
                                ],
                              ),
                            ),
                            trailing:Image.asset("assets/image/Group.png",height: 3.5.h,fit: BoxFit.fill,) ,
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
          isloading?Center(child: Lottie.asset("assets/lottie/129489-heart-filled (1).json",width: 20.h,height: 20.h,fit: BoxFit.fill)):Container()
        ],
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

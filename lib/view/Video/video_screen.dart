import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Video_Screen extends StatefulWidget {
  const Video_Screen({Key? key}) : super(key: key);

  @override
  State<Video_Screen> createState() => _Video_ScreenState();
}

class _Video_ScreenState extends State<Video_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,mainAxisExtent: 35.h),
        children: [
          Padding(
            padding:  EdgeInsets.all(5.sp),
            child: Container(
              height:30.h,
              width: 48.w,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Stack(
                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/image/1.png",
                      fit: BoxFit.fill,
                      height:35.h,
                      width: 48.w,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.sp ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 3.5.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Center(child: Text("🟢 Online",style: TextStyle(color: Color(0xFF4ADE80),fontSize: 10.sp),)),
                            ),
                            Container(
                              height: 3.5.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Center(child: Text("❤ 5.6 k",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 10.sp),)),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(3.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                 Image.asset("assets/image/Group 34.png",height: 3.5.h,width: 5.h,fit: BoxFit.fill,)  ,
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.sp ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 3.5.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  child: Center(child: Row(
                                    children: [
                                      Icon(Icons.female,color: Color(0xFFFF4D67),size: 15.sp,),
                                      Text("21,Canada",style: TextStyle(fontSize: 7.sp,color: Colors.white),),
                                    ],
                                  )),
                                ),
                                Container(
                                  height: 3.5.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.sp),
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                  child: Center(child: Text("⭐ 1/min",style: TextStyle(color: Colors.white,fontSize: 10.sp),)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Padding(
          //   padding:  EdgeInsets.all(5.sp),
          //   child: Container(
          //     height:30.h,
          //     width: 48.w,
          //     decoration: BoxDecoration(
          //         color: Colors.black,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Stack(
          //       children: [
          //         ClipRRect(borderRadius: BorderRadius.circular(10),
          //           child: Image.asset("assets/image/Image.png",
          //             fit: BoxFit.fill,
          //             height:35.h,
          //             width: 48.w,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

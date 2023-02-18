import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding:  EdgeInsets.only(top: 3.h),
        child: Column(
          children: [
             ListTile(leading: Text("Choose Your Interest",style: TextStyle(color: Colors.white,fontSize: 15.sp),)),
             SizedBox(height: 1.1.h,),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 3.w),
               child: Text("Choose your interests and get the best video recommendations.",style: TextStyle(color: Colors.white),),
             ),
            SizedBox(height: 3.h,),
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
                  SizedBox(height: 1.5.h,),

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
                  SizedBox(height: 1.5.h,),

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
                  SizedBox(height:  1.5.h,),

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
                  SizedBox(height: 1.5.h,),

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
                  SizedBox(height: 1.5.h,),

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
                  SizedBox(height: 1.5.h,),

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
                  SizedBox(height: 1.5.h,),

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
                  Container(
                    height: 15.h,
                    width: 100.w,
                    color: Colors.white,
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                         Navigator.pushNamed(context,'yourself');
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
                          Navigator.pushNamed(context,'yourself');
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
      ),
    );
  }
  Widget Selecte(String text, int i) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.sp,color: Color(0xFFFF4D67)),
          primary: cnt == i ? Color(0xFFFF4D67) : Colors.black,
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

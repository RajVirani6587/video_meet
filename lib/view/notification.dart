import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class Notification_screen extends StatefulWidget {
  const Notification_screen({Key? key}) : super(key: key);

  @override
  State<Notification_screen> createState() => _Notification_screenState();
}

class _Notification_screenState extends State<Notification_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 3.h,),
          Align(alignment: Alignment.center,
              child: Image.asset("assets/image/Group 33.png", height: 20.h,
                width: 20.h,
                fit: BoxFit.fill,)),
          Text("Final Step", style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp),),
          SizedBox(height: 2.h,),
          Align(alignment: Alignment.center,
              child: Text(
                "Enable Microphone and camera access to get the parth started.",
                style: TextStyle(fontSize: 15),)),
          SizedBox(height: 3.h,),
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.camera_alt, size: 30.sp, color: Color(0xFF6C3B8C),),
                title: Text(
                  "Camera", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("To start live video chat"),
              ),
              ListTile(
                leading: Icon(Icons.mic, size: 30.sp, color: Color(0xFF6C3B8C),),
                title: Text(
                  "Microphone", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("For voice calls"),
              ),
              ListTile(
                leading: Icon(
                  Icons.file_present, size: 30.sp, color: Color(0xFF6C3B8C),),
                title: Text(
                  "Storge", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("To start Image pike"),
              ),
              SizedBox(height: 2.h,),
              Container(
                color: Colors.black,
                height: 15.h,
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          InkWell(
            onTap: () async {
              Navigator.pushNamed(context,'bottom');
              Map<Permission, PermissionStatus> map =
              await[Permission.microphone, Permission.camera , Permission.storage].request();
              if (await Permission.camera.isDenied) {
                print("Camera Deny");
              }
              if (await Permission.storage.isDenied) {
                print("location");
              }
              if(await Permission.microphone.isDenied) {
                print("microphone");
              }
              showCustomDialog(context);
            },
            child: Container(
              height: 8.h,
              width: 85.w,
              decoration: BoxDecoration(
                  color: const Color(0xFF6C3B8C),
                  borderRadius: BorderRadius.circular(10.sp)
              ),
              child: Center(child: Text(
                "ALLOW", style: TextStyle(color: Colors.white, fontSize: 25),)),
            ),
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }
  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20.sp)),
            child: SizedBox.expand(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:  EdgeInsets.all(6.sp),
                        child: Container(
                          height: 5.5.h,
                          width: 65.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              border: Border.all(color: Color(0xFFFF4D67),width: 3.sp)
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 1.w,),
                              Icon(Icons.no_accounts,color: Color(0xFFFF4D67),size: 30.sp,),
                              SizedBox(width: 2.w,),
                              Text("ZERO TOLERANCE POLICY",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 10.sp,decoration: TextDecoration.none),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Image.asset("assets/image/Group 32 (2).png",height: 10.h,width: 10.h,fit: BoxFit.fill,),
                    SizedBox(height: 1.h,),
                    Text("Age Verification",style: TextStyle(fontSize: 20.sp,color: Colors.white,decoration: TextDecoration.none),),
                    SizedBox(height: 1.h,),
                    Text("You must be 18 years old or over to enter.",textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.sp,color: Colors.white,decoration: TextDecoration.none),),
                    SizedBox(height: 1.h,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context,'/');
                      },
                      child: Container(
                        height: 7.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF4D67),
                            borderRadius: BorderRadius.circular(10.sp)
                        ),
                        child: Center(
                          child: Text("I am 18 or older-Enter",style: TextStyle(color: Colors.white,fontSize: 15.sp,decoration: TextDecoration.none),),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                  ],
                ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

}

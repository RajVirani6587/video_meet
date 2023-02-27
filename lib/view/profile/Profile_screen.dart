import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/model/model_class.dart';
import 'package:video_meet/provider/provider_class.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  @override
  Widget build(BuildContext context) {
    txt m1 = ModalRoute.of(context)!.settings.arguments as txt;
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 15.h,
              width: 15.h,
              child: CircleAvatar(
                backgroundImage: FileImage(File(m1.image.toString())),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          ListTile(
            leading: Container(
              height:4.h,
              width: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Icon(Icons.text_fields,color: Colors.black,),
            ),
            title: Text("Nickname",style: TextStyle(fontSize: 20,color: Colors.white),),
            trailing: Text("${m1.name}",style:TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
          ),
          ListTile(
            leading: Container(
              height:4.h,
              width: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Icon(Icons.call_split,color: Colors.black,),
            ),
            title: Text("Gender",style: TextStyle(fontSize: 20,color: Colors.white),),
            trailing: Text("${m1.gender}",style:TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
          ),
          ListTile(
            leading: Container(
              height:4.h,
              width: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Icon(Icons.calendar_month_outlined,color: Colors.black,),
            ),
            title: Text("Age",style: TextStyle(fontSize: 20,color: Colors.white),),
            trailing: Text("${m1.age}",style:TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
          ),
          ListTile(
            leading: Container(
              height:4.h,
              width: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Icon(Icons.location_on,color: Colors.black,),
            ),
            title: Text("country ",style: TextStyle(fontSize: 20,color: Colors.white),),
            trailing: Text("${m1.countey}",style:TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
          ),
          InkWell(
            onTap: (){
               Navigator.pushReplacementNamed(context,'first');
            },
            child: ListTile(
              leading: Container(
                height:4.h,
                width: 4.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.shade100,
                ),
                child: Icon(Icons.logout,color: Colors.red,),
              ),
              title: Text("Logout ",style: TextStyle(fontSize: 20,color: Colors.red),),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            height: 17.h,
            color: Colors.white,
          ),
          SizedBox(height: 5.h),

        ],
      ),
    );
  }
}

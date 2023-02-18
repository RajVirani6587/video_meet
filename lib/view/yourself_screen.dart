import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Yourself_Screen extends StatefulWidget {
  const Yourself_Screen({Key? key}) : super(key: key);

  @override
  State<Yourself_Screen> createState() => _Yourself_ScreenState();
}

class _Yourself_ScreenState extends State<Yourself_Screen> {
  File f1 = File("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        children: [
          SizedBox(height: 2.5.h,),
          ListTile(
            leading: IconButton(onPressed: (){
              Navigator.pushNamed(context, 'interest');
            },icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 30),),
            title: Text("Tell us About Yourself",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ) ,
          SizedBox(height: 2.5.h,),
          InkWell(
            onTap: (){
              f1.path.isEmpty?
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return Expanded(
                    child: AlertDialog(
                      title: Text('Red Alert',style: TextStyle(color: Colors.red),),
                      content: Text('Please Upload a Photo'),
                      actions: [
                        InkWell(onTap:(){
                          Navigator.pop(context);
                        },
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              child: Text("ok",style: TextStyle(fontSize: 20),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ) : Navigator.pushNamed(context,'your',);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                    depth: 4,
                    lightSource: LightSource.topLeft,
                    color: Colors.white60,
                  ),child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/image/Rectangle 2.jpg",fit: BoxFit.fill, height: height!*0.07,width: width!*0.85,)),),
                Text('Confirm',style: TextStyle(color: Colors.white,fontSize: 20),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

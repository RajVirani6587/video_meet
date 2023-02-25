import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/provider/provider_class.dart';

class Detail_screen extends StatefulWidget {
  const Detail_screen({Key? key}) : super(key: key);

  @override
  State<Detail_screen> createState() => _Detail_screenState();
}

class _Detail_screenState extends State<Detail_screen> {
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  @override
  Widget build(BuildContext context) {

    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 3.w),
                      child: InkWell(onTap: (){
                        Navigator.pushNamed(context,'bottom');
                      },child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20.sp,)),
                    ),
                    IconButton(onPressed: (){}, icon:Icon(Icons.more_vert,color: Colors.white,))
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Text("🟢 ${home_providerf!.Datapickkk!.Name}❤ヾ",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w700),),
            ),
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.female,color: Color(0xFFFF4D67),size: 20.sp,),
                  Text("${home_providerf!.Datapickkk!.year}",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 12.sp,),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

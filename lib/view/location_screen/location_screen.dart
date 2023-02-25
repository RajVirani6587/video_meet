import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
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
  @override
  Widget build(BuildContext context) {


    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 3.h,),
          Align(
            alignment: Alignment.center ,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:15.h),
              child: Text("Nearby",style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w700),),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: home_providerf!.l1.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 2.h),
                    child: InkWell(
                      onTap: (){
                        home_providerf!.Datapickkk = Model(
                          con: home_providerf!.l1[index].con,
                          Image: home_providerf!.l1[index].Image,
                           km:   home_providerf!.l1[index].km,
                           Name: home_providerf!.l1[index].Name,
                           year: home_providerf!.l1[index].year,
                           video:home_providerf!.l1[index].video,
                        );
                        Navigator.pushNamed(context, 'detail');
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
    );
  }
}

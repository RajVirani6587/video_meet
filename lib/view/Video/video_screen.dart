import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/model/model_class.dart';
import 'package:video_meet/provider/provider_class.dart';

class Video_Screen extends StatefulWidget {
  const Video_Screen({Key? key}) : super(key: key);

  @override
  State<Video_Screen> createState() => _Video_ScreenState();
}

class _Video_ScreenState extends State<Video_Screen> {
  Home_Provider? home_providerf;
  Home_Provider? home_providert;
  @override
  Widget build(BuildContext context) {
    home_providerf = Provider.of<Home_Provider>(context,listen: false);
    home_providert = Provider.of<Home_Provider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        itemCount: home_providerf!.l1.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,mainAxisExtent: 35.h),
        itemBuilder: (context,index){
         return  Padding(
           padding:  EdgeInsets.all(5.sp),
           child: InkWell(
             onTap: (){
               home_providerf!.Datapickkk = Model(
                 TImage: home_providerf!.l1[index].TImage,
                 like: home_providerf!.l1[index].like,
                 Image2: home_providerf!.l1[index].Image2,
                 flag: home_providerf!.l1[index].flag,
                 centry:home_providerf!.l1[index].centry,
                 con: home_providerf!.l1[index].con,
                 Image: home_providerf!.l1[index].Image,
                 km:   home_providerf!.l1[index].km,
                 Name: home_providerf!.l1[index].Name,
                 year: home_providerf!.l1[index].year,
                 video:home_providerf!.l1[index].video,
               );
               Navigator.pushNamed(context, 'videoplay');
             },
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
                     child: Image.asset("${home_providerf!.l1[index].Image}",
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
                               child: Center(child: Text("❤ ${home_providerf!.l1[index].like} k",style: TextStyle(color: Color(0xFFFF4D67),fontSize: 10.sp),)),
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
                                   width: 24.w,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20.sp),
                                     color: Colors.black.withOpacity(0.6),
                                   ),
                                   child: Center(child: Row(
                                     children: [
                                       Icon(Icons.female,color: Color(0xFFFF4D67),size: 15.sp,),
                                       Text("${home_providerf!.l1[index].centry}",style: TextStyle(fontSize: 7.sp,color: Colors.white),),
                                     ],
                                   )),
                                 ),
                                 Text("${home_providerf!.l1[index].flag}",style: TextStyle(fontSize: 15.sp),)
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
         );
        },
      ),
    );
  }
}

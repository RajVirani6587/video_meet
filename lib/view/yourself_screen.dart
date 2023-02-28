import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/const/conts.dart';
import 'package:video_meet/model/ads_screen.dart';
import 'package:video_meet/model/model_class.dart';

class Yourself_Screen extends StatefulWidget {
  const Yourself_Screen({Key? key}) : super(key: key);

  @override
  State<Yourself_Screen> createState() => _Yourself_ScreenState();
}

class _Yourself_ScreenState extends State<Yourself_Screen> {
  File f1 = File("");
  TextEditingController txtname = TextEditingController();
  TextEditingController txtgender = TextEditingController();
  TextEditingController txtage = TextEditingController();
  TextEditingController txtcountry = TextEditingController();

  List<String> gender = ["Male","Female","others"];

  String select = 'Male';

  List<String> contry =
  ['India','Pakistan','Bangladesh','Afghanistan','Angola',
    'Aruba','vietnam','egypt','saudi arabia','UAE','syria',
    'turkey','colombia','venezuela','Brazil','nigeria','madagascar','ukraine',
    'bahrain','taiwan','Belize','bosnia-and-herzegovina','canada','denmark',
    'finland','france','hong kong','iran','israel','jordan','japan','kuwait',
    'mexico','nepal','new zealand','norway','oman','portugal','qatar','russia','usa'];

  String selectContry = 'India';

  var txtkey = GlobalKey<FormState>();

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
    return Form(
      key:txtkey,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body:Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 2.h,),
                  ListTile(
                    leading: IconButton(onPressed: (){
                      Navigator.pushNamed(context, 'interest');
                    },icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 30),),
                    title: Text("Tell us About Yourself",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ) ,
                  SizedBox(height: 3.h,),
                  InkWell(
                    onTap: (){
                      bottomsheetdilaog();
                    },
                    child: Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white30,
                      ),
                      child: f1.path.isEmpty?
                      Container(height: 20.h,width: 20.h,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white,width: 5),),
                        child: Icon(Icons.person,color: Colors.white,size: 80.sp,),):
                      CircleAvatar(backgroundImage: FileImage(f1),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 2.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:5.w),
                        child: TextFormField(
                          validator: (value){
                                  return value!.length < 2?'Name must be greater than two characters':null;
                                  },
                          style: TextStyle(color: Colors.white),
                          controller: txtname,
                          decoration: InputDecoration(
                            filled: true,
                              fillColor: Colors.white12,
                              prefixIcon: Icon(Icons.person,color: Colors.white,),
                              label: Text("NickName",style: TextStyle(color: Colors.white),),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2,color: Colors.white),
                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:5.w),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Gender";
                                }
                                else {
                                  return null;
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              controller: txtgender,
                              decoration: InputDecoration(
                                filled: true,
                                  fillColor: Colors.white12,
                                  prefixIcon: Icon(Icons.call_split,color: Colors.white,),
                                  label: Text("Gender",style: TextStyle(color: Colors.white),),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2,color: Colors.white),
                                  ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: 5),
                              child: DropdownButton(
                                value: select,
                                  items: [
                                DropdownMenuItem(child: Text("Male",style: TextStyle(color: Color(0xFFFF4D67)),),value: "Male",),
                                DropdownMenuItem(child: Text("Female",style: TextStyle(color: Color(0xFFFF4D67)),),value: "Female",),
                                DropdownMenuItem(child: Text("others",style: TextStyle(color: Color(0xFFFF4D67)),),value: "others",),
                              ],
                                  onChanged:(value){
                                setState(() {
                                  txtgender.text=value! ;
                                  select = value;
                                });
                              }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:5.w),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Age";
                            }
                            else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.numberWithOptions(),
                          readOnly: true,
                          style: TextStyle(color: Colors.white),
                          controller: txtage,
                          onTap: (){
                            datepick();
                          },
                          decoration: InputDecoration(
                            filled: true,
                              fillColor: Colors.white12,
                              prefixIcon: Icon(Icons.calendar_month,color: Colors.white,),
                              label: Text("Age",style: TextStyle(color: Colors.white),),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                borderSide: BorderSide(width: 2,color: Colors.white),
                              ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:5.w),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Country";
                                }
                                else {
                                  return null;
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              controller: txtcountry,
                              onTap: (){},
                              decoration: InputDecoration(
                                filled: true,
                                  fillColor: Colors.white12,
                                  prefixIcon: Icon(Icons.location_on_outlined,color: Colors.white,),
                                  label: Text("Country",style: TextStyle(color: Colors.white),),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.sp),
                                    borderSide: BorderSide(width: 2,color: Colors.white),
                                  ),
                                ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right: 5),
                              child: DropdownButton(
                                style: TextStyle(color: Color(0xFFFF4D67)),
                                  value: selectContry,
                                  items: [
                                    DropdownMenuItem(child: Text("India",),value: "India",),
                                    DropdownMenuItem(child: Text("Pakistan",),value: "Pakistan",),
                                    DropdownMenuItem(child: Text("Bangladesh",),value: "Bangladesh",),
                                    DropdownMenuItem(child: Text("Afghanistan",),value: "Afghanistan",),
                                    DropdownMenuItem(child: Text("Angola",),value: "Angola",),
                                    DropdownMenuItem(child: Text("Aruba",),value: "Aruba",),
                                    DropdownMenuItem(child: Text("vietnam",),value: "vietnam",),
                                    DropdownMenuItem(child: Text("egypt",),value: "egypt",),
                                    DropdownMenuItem(child: Text("saudi arabia",),value: "saudi arabia",),
                                    DropdownMenuItem(child: Text("UAE",),value: "UAE",),
                                    DropdownMenuItem(child: Text("syria",),value: "syria",),
                                    DropdownMenuItem(child: Text("turkey",),value: "turkey",),
                                    DropdownMenuItem(child: Text("colombia",),value: "colombia",),
                                    DropdownMenuItem(child: Text("venezuela",),value: "venezuela",),
                                    DropdownMenuItem(child: Text("Brazil",),value: "Brazil",),
                                    DropdownMenuItem(child: Text("nigeria",),value: "nigeria",),
                                    DropdownMenuItem(child: Text("madagascar",),value: "madagascar",),
                                    DropdownMenuItem(child: Text("ukraine",),value: "ukraine",),
                                    DropdownMenuItem(child: Text("bahrain",),value: "bahrain",),
                                    DropdownMenuItem(child: Text("taiwan",),value: "taiwan",),
                                    DropdownMenuItem(child: Text("Belize",),value: "Belize",),
                                    DropdownMenuItem(child: Text("bosnia-and-herzegovina",),value: "bosnia-and-herzegovina",),
                                    DropdownMenuItem(child: Text("canada",),value: "canada",),
                                    DropdownMenuItem(child: Text("denmark",),value: "denmark",),
                                    DropdownMenuItem(child: Text("finland",),value: "finland",),
                                    DropdownMenuItem(child: Text("france",),value: "france",),
                                    DropdownMenuItem(child: Text("hong kong",),value: "hong kong",),
                                    DropdownMenuItem(child: Text("iran",),value: "iran",),
                                    DropdownMenuItem(child: Text("israel",),value: "israel",),
                                    DropdownMenuItem(child: Text("jordan",),value: "jordan",),
                                    DropdownMenuItem(child: Text("japan",),value: "japan",),
                                    DropdownMenuItem(child: Text("kuwait",),value: "kuwait",),
                                    DropdownMenuItem(child: Text("mexico",),value: "mexico",),
                                    DropdownMenuItem(child: Text("nepal",),value: "nepal",),
                                    DropdownMenuItem(child: Text("new zealand",),value: "new zealand",),
                                    DropdownMenuItem(child: Text("norway",),value: "norway",),
                                    DropdownMenuItem(child: Text("oman",),value: "oman",),
                                    DropdownMenuItem(child: Text("portugal",),value: "portugal",),
                                    DropdownMenuItem(child: Text("qatar",),value: "qatar",),
                                    DropdownMenuItem(child: Text("russia",),value: "russia",),
                                    DropdownMenuItem(child: Text("usa",),value: "usa",),
                                  ],
                                  onChanged:(value){
                                    setState(() {
                                      txtcountry.text=value!;
                                      selectContry = value;
                                    });
                                  }),
                             ),
                           ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
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
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                        if(txtkey.currentState!.validate() == true && f1.path.isEmpty==false){
                          interAds();
                          setState(() {
                            isloading=true;
                          });
                          Timer(Duration(seconds: 4), () {
                            setState(() {
                              isloading=false;
                            });
                            txt m1 = txt(
                              age: txtage.text,
                              image: f1.path,
                              name: txtname.text,
                              countey: txtcountry.text,
                              gender: txtgender.text,
                            );
                            Navigator.pushNamed(context,'notification',arguments: m1);
                          });
                        }
                        else{
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
                          );
                        }
                      },
                      child: Container(
                        height: 7.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF4D67),
                            borderRadius: BorderRadius.circular(20.sp)
                        ),
                        child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18.sp),)),
                      ),
                    ),
                  ),
                ],
              ),
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

  void datepick() async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFF4D67), // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(0),
      lastDate: DateTime(2999),
    );
    if(pickedDate != null ){
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        txtage = TextEditingController(text: "$formattedDate");
      });
    }
    else{
      print("Date is not selected");
    }
  }
  void bottomsheetdilaog(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context:context,
        builder:(context){
          return Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), color: Colors.white,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: ()async{
                  ImagePicker img = ImagePicker();
                  XFile? f2 =  await img.pickImage(source: ImageSource.camera);
                  setState((){
                    f1 = File(f2!.path);
                  });
                  Navigator.pop(context);

                },child: Text("Take Photo",style: TextStyle(fontSize: 20),)),
                InkWell(onTap: ()async{
                  ImagePicker img = ImagePicker();
                  XFile? f2 =  await img.pickImage(source: ImageSource.gallery);
                  setState((){
                    f1 = File(f2!.path);
                  });
                  Navigator.pop(context);
                },
                    child: Text("Choose From Library",style: TextStyle(fontSize: 20))),
                InkWell(onTap: (){
                  Navigator.pop(context);
                },child: Text("Cancel",style: TextStyle(fontSize: 20))),
              ],
            ),
          );
        }
    );
  }
}

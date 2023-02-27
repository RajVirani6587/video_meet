import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:video_meet/const/conts.dart';
import 'package:video_meet/model/admodel.dart';
import 'package:http/http.dart' as http;
import 'package:video_meet/model/ads_screen.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      print("internet---------->$isDeviceConnected");
      if (isDeviceConnected == false && isAlertSet == false) {
        showDialogBox();
        setState(() {
          isAlertSet = true;
        });
      } else {
        getAdid();
        isLogin();
      }
    });
  }

  void showDialogBox() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("No Connection"),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() {
                    isAlertSet = false;
                  });
                  isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  } else {
                    getAdid();
                    isLogin();
                  }
                },
                child: const Text("ok"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(child: Lottie.asset("assets/lottie/48726-student.json",fit: BoxFit.fill,)),
            Lottie.asset("assets/lottie/7314-loading.json",),
          ],
        ),
      ),
    );
  }

  void isLogin()async{

    if (isDeviceConnected == false) {
      showDialogBox();
    }
    else
    {
      Timer(Duration(seconds: 5),
              ()=>Navigator.pushReplacementNamed(context,'terms')
      );
    }
  }
  getAdid()async{
    Map<String, String> requestHeaders = {
      'Host': '<calculated when request is sent>',
      'User-Agent': 'PostmanRuntime/7.30.0',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'authorization': 'admin',
    };
    String newslike = "http://3.108.31.187:8080/get-appkey/5";
    var newsString = await http.get(Uri.parse(newslike),headers:requestHeaders);

    print(newsString);
    newsjson = adModelFromJson(newsString.body);
    print('-----data----->${newsjson?.data[0].keyId}');
    openAds();
  }
}
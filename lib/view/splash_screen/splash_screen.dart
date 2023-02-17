import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    isLogin();
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
      Timer(Duration(seconds: 4),
              ()=>Navigator.pushReplacementNamed(context,'first')
      );
  }
}
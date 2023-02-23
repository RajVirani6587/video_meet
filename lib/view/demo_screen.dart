import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:video_meet/view/splash_screen/intro_screen.dart';
import 'package:video_meet/view/splash_screen/splash_screen.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children:[
          Intro_Scrren(),
          Splash_Screen(),
          Intro_Scrren(),
          Intro_Scrren(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        flat: true,
        useActiveColorByDefault: false,
        items: [
          RollingBottomBarItem(Icons.home, label: 'Video', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.star, label: 'B-Video', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.person, label: 'Nearby', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.access_alarm, label: 'Profile', activeColor: Colors.redAccent),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}

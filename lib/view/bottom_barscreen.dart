import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:video_meet/view/Video/tabbar_video.dart';
import 'package:video_meet/view/splash_screen/intro_screen.dart';
import 'package:video_meet/view/splash_screen/splash_screen.dart';


class Bottom_Screen extends StatefulWidget {
  const Bottom_Screen({Key? key}) : super(key: key);

  @override
  State<Bottom_Screen> createState() => _Bottom_ScreenState();
}

class _Bottom_ScreenState extends State<Bottom_Screen> {

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
          Tabarvideo_Screen(),
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
          RollingBottomBarItem(Icons.favorite, label: 'B-Video', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.location_on, label: 'Nearby', activeColor: Colors.redAccent),
          RollingBottomBarItem(Icons.person, label: 'Profile', activeColor: Colors.redAccent),
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

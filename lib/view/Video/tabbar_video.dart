import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_meet/view/Video/newVideo_screen.dart';
import 'package:video_meet/view/Video/video_screen.dart';

class Tabarvideo_Screen extends StatefulWidget {
  const Tabarvideo_Screen({Key? key}) : super(key: key);

  @override
  State<Tabarvideo_Screen> createState() => _Tabarvideo_ScreenState();
}

class _Tabarvideo_ScreenState extends State<Tabarvideo_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length:2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: 1.h,
            bottom: TabBar(
            indicatorWeight: 3,
             indicatorColor: Color(0xFFFF4D67),
             labelColor: Color(0xFFFF4D67),
             unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Hot',),
              Tab(text: 'New',),
            ],
          ),),
          body: TabBarView(
            children: [
              Video_Screen(),
              Newvideo_Screen(),
            ],
          ),
        ),
    );
  }
}

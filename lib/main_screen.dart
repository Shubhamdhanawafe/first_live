// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:first_live/Tabs_/home_tab.dart';
import 'package:first_live/Tabs_/profi_tab.dart';
import 'package:first_live/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'CommonAppbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';

import 'profile_screen.dart';

class main_screen extends StatefulWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  String assets_path = "assets/images/";
  var imagelist = [];
  var titlelist = [];
  var memeName = [];
  var memeImage = [];

  // void circurl() {
  //   for (var i = 0; i < 10; i++) {
  //     Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: CircleAvatar(
  //         radius: 40,
  //         backgroundImage: AssetImage(assets_path + 'profile.webp'),
  //       ),
  //     );
  //   }
  // }

  List colorlist = [
    Colors.black,
    Colors.white,
  ];

  late Color background_color;
  late Color text_color;
  bool video_mem = false;

  @override
  Widget build(BuildContext context) {
    background_color = colorlist[1];
    text_color = colorlist[0];

    return DefaultTabController(
        length: 5,
        child: Scaffold(
            backgroundColor: background_color,
            bottomNavigationBar: getBottomBar(),
            appBar: getAppbar_main(),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [Home_tab(), check, check, check, Profile_tab()],
            )));
  }
}

Widget check = Center(
  child: CircularProgressIndicator(),
);

class Customdelegate extends SliverPersistentHeaderDelegate {
  TabBar tabBar;
  Customdelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}



//  ListView(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 38,
//                 backgroundImage: AssetImage(assets_path + imagelist[1]),
//               ),
//             ),
//           ],
//         )

// Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 38,
//                 backgroundImage: AssetImage(assets_path + imagelist[1]),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 38,
//                 backgroundImage: AssetImage(assets_path + imagelist[1]),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 38,
//                 backgroundImage: AssetImage(assets_path + imagelist[1]),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 38,
//                 backgroundImage: AssetImage(assets_path + imagelist[1]),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 38,
//                 backgroundImage: AssetImage(assets_path + imagelist[1]),
//               ),
//             ),
//           ],
//         )

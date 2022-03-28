import 'package:flutter/material.dart';
import 'main_screen.dart';

String assets_path = "assets/images/";
int posi = 0;

List colorlist = [
  Colors.black,
  Colors.white,
];

// AppBar getAppbar() {
//   AppBar ap;
//   // if (m) {
//   //   ap = getAppbar_pro();
//   // } else {
//   //   ap = getAppbar_main();
//   // }
//   return ap;
// }

AppBar getAppbar_main() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(
      "Instagram",
      style: TextStyle(
          fontFamily: "BeautyMountainsPersonalUse-od7z",
          color: Colors.black,
          fontSize: 33.0),
    ),
    actions: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: colorlist[1],
          child: InkWell(
            child: Image.asset(
              assets_path + 'cae.png',
              width: 55,
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: colorlist[1],
          child: InkWell(
            child: Image.asset(
              assets_path + 'b--.png',
              width: 55,
            ),
          ),
        ),
      )
    ],
  );
}

AppBar getAppbar_pro() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      children: [
        Icon(Icons.lock_rounded),
        Text(
          "__shubhamd__",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    actions: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: colorlist[1],
          child: InkWell(
            child: Image.asset(
              assets_path + 'cae.png',
              width: 55,
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: colorlist[1],
          child: InkWell(
              child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.menu,
              size: 35,
            ),
          )),
        ),
      )
    ],
  );
}

Widget getBottomBar() {
  return TabBar(
    onTap: (index) {
      posi = index;
      
    },
    tabs: [
      Tab(
        icon: Icon(
          Icons.home,
          size: 30,
        ),
      ),

      Tab(
        icon: Icon(
          Icons.search,
          size: 30,
        ),
      ),

      Tab(
        icon: Image.asset(
          assets_path + "b1u.png",
          width: 25,
        ),
      ),

      Tab(
        icon: Icon(
          Icons.favorite_border,
          size: 28,
        ),
      ),

      Tab(
          icon: CircleAvatar(
        radius: 14,
        backgroundImage: AssetImage(assets_path + "pro2.jpg"),
      )),

      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [

      //   ],
      // ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Icon(
      //       Icons.search,
      //       size: 30,
      //     ),
      //   ],
      // ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Image.asset(
      //       assets_path + "b1u.png",
      //       width: 25,
      //     ),
      //   ],
      // ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Icon(
      //       Icons.favorite_border,
      //       size: 28,
      //     ),
      //   ],
      // ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     CircleAvatar(
      //       radius: 14,
      //       backgroundImage: AssetImage(assets_path + "pro2.jpg"),
      //     )
      //   ],
      // ),
    ],
  );
}

AppBar Profile_Screen_bar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back)),
    automaticallyImplyLeading: true,
    title: Text("_Pokimon"),
    actions: [
      InkWell(
        child: Icon(Icons.more_vert),
      )
    ],
  );
}

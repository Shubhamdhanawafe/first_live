// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_live/CommonAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({Key? key}) : super(key: key);

  @override
  _Profile_screenState createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  List list = [];

  Widget check = Center(
    child: CircularProgressIndicator(),
  );

  getJson_data() async {
    await rootBundle.loadString("assets/all.json").then((value) {
      List list = jsonDecode(value)['Post'];
      List<Widget> widget_list = [];
      for (var i = 0; i < list.length; i++) {
        widget_list.add(Container(
            padding: EdgeInsets.zero,
            width: 50,
            height: 50,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: list[i],
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
            )
            // Image.network(

            //   fit: BoxFit.cover,
            // ),
            ));
      }
      setState(() {
        check = GridView.count(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 3,
          children: widget_list,
        );
      });
    });
  }

  Widget profile_first_ui() {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Expanded(
          flex: 6,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 35, 10),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_Zj3twqYWJ5CQtkK6zWAKi9ltZ1EIoNe9YcfwzgQgRRKwaTDPykbGAjwAGD43h3VD9y8&usqp=CAU"),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "8",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text("Posts"),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "24",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text("Followers"),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "24",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text("Following"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getJson_data();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            // bottomNavigationBar: getBottomBar(),
            body: NestedScrollView(
                physics: NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 400,
                      collapsedHeight: 400,
                      flexibleSpace: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Profile_Screen_bar(context),
                          profile_first_ui(),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Pokemon India"),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue))),
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Message",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(right: 7),
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size(45, 35)),
                                      onPressed: () {},
                                      child:
                                          Image.asset(assets_path + "aa.png"))),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          "https://www.dexerto.com/wp-content/uploads/2021/02/How-to-watch-Pokemon-Post-Malone-concert.jpg",
                                          // placeholder: (context,url) =>Center(
                                          //   child: CircularProgressIndicator())
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "#Mega_greninja",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ),
                    SliverPersistentHeader(
                      delegate: Customdelegate(TabBar(
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                          tabs: [
                            Center(
                              child: Icon(
                                Icons.grid_on,
                                size: 30,
                              ),
                            ),
                            Image.asset("assets/images/p.png"),
                            Image.asset("assets/images/16453.png", height: 30),
                          ])),
                      floating: true,
                      pinned: true,
                    )
                  ];
                },
                body: TabBarView(
                  children: [check, check, check],
                ))));
  }
}

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
// Scaffold(
//           backgroundColor: Colors.white,
//           appBar: Profile_Screen_bar(context),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               profile_first_ui(),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Text("Pokemon India"),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                       flex: 6,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ElevatedButton(
//                             onPressed: () {},
//                             child: Text(
//                               "Follow",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all(Colors.blue))),
//                       )),
//                   Expanded(
//                       flex: 6,
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 5.0),
//                         child: OutlinedButton(
//                             onPressed: () {},
//                             child: Text(
//                               "Message",
//                               style: TextStyle(color: Colors.black),
//                             )),
//                       )),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 7),
//                     child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             minimumSize: Size(45, 35)),
//                         onPressed: () {},
//                         child: Icon(Icons.add_a_photo)),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: Column(
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         CircleAvatar(
//                             radius: 40,
//                             backgroundImage: CachedNetworkImageProvider(
//                               "https://www.dexerto.com/wp-content/uploads/2021/02/How-to-watch-Pokemon-Post-Malone-concert.jpg",
//                               // placeholder: (context,url) =>Center(
//                               //   child: CircularProgressIndicator())
//                             )),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             "#Mega_greninja",
//                             style: TextStyle(fontSize: 12),
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 50,
//                 child: AppBar(
//                   elevation: 0,
//                   backgroundColor: Colors.white,
//                   bottom: TabBar(
//                     indicatorColor: Colors.black,
//                     tabs: [
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image.asset("assets/images/grid.png"),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Image.asset("assets/images/p.png"),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Image.asset("assets/images/a.png"),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                   child: TabBarView(children: [
//                 check,
//                 Container(
//                   child: Text("data"),
//                 ),
//                 Container(
//                   child: Text("data"),
//                 ),
//               ]))
//             ],
//           ),
//         )

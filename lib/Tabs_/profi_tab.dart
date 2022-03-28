import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../CommonAppbar.dart';

class Profile_tab extends StatefulWidget {
  const Profile_tab({Key? key}) : super(key: key);

  @override
  State<Profile_tab> createState() => _Profile_tabState();
}

class _Profile_tabState extends State<Profile_tab> {
  var all_d = null;

  Widget check = Center(
    child: CircularProgressIndicator(),
  );

  @override
  void initState() {
    super.initState();
    getJson_data();
  }

  getJson_data() async {
    await rootBundle.loadString("assets/all.json").then((value) {
      all_d = jsonDecode(value)['Emma_Pond'][0];
      List list = all_d["posts"];
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 6,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 35, 10),
                child: CircleAvatar(
                  radius: 43,
                  backgroundImage: AssetImage("assets/images/pro2.jpg"),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    all_d["post_c"],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text("Posts", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    all_d["Followers"],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text("Followers", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    all_d["Following"],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  Text("Following", style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Emma Pond",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                "Dancer",
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                "WE ARE ALL DANCERS",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5.0),
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.black),
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero, minimumSize: Size(45, 35)),
                      onPressed: () {},
                      child: Image.asset(assets_path + "aa.png"))),
            ],
          ),
        ),
        Row(
          children: getStory(),
        ),
      ],
    );
  }

  getStory() {
    List<Widget> widget_list = [];
    List st = all_d["story"];
    for (var i = 0; i < st.length; i++) {
      widget_list.add(Padding(
        padding: const EdgeInsets.only(top: 10, left: 20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            CircleAvatar(
                radius: 40,
                backgroundImage: CachedNetworkImageProvider(
                  st[i]["url"],
                  // placeholder: (context,url) =>Center(
                  //   child: CircularProgressIndicator())
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                st[i]["name"],
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ));
    }
    return widget_list;
    // .add(Padding(
    //   padding: const EdgeInsets.only(top: 10, left: 20),
    //   child: Column(
    //     // ignore: prefer_const_literals_to_create_immutables
    //     children: [
    //       CircleAvatar(radius: 40, backgroundImage: ImageIcon(image)),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 8.0),
    //         child: Text(
    //           st[i]["name"],
    //           style: TextStyle(fontSize: 12),
    //         ),
    //       ),
    //     ],
    //   ),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: all_d == null
            ? check
            : NestedScrollView(
                physics: NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, isScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 350,
                      collapsedHeight: 350,
                      flexibleSpace: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profile_first_ui(),
                        ],
                      ),
                    ),
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
                            Image.asset(
                              "assets/images/16453.png",
                              height: 30,
                            ),
                          ])),
                      floating: true,
                      pinned: true,
                    )
                  ];
                },
                body: TabBarView(
                  children: [check, check, check],
                )));
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

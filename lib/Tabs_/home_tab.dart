import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

import '../profile_screen.dart';
import '../video_screen.dart';

class Home_tab extends StatefulWidget {
  const Home_tab({Key? key}) : super(key: key);

  @override
  State<Home_tab> createState() => _Home_tabState();
}

class _Home_tabState extends State<Home_tab> {
  String assets_path = "assets/images/";
  var imagelist = [];
  var titlelist = [];
  var memeName = [];
  var memeImage = [];
  late Color background_color;
  late Color text_color;
  bool video_mem = false;

  List<Widget> circularwid() {
    List<Widget> widget = [];
    int i = 0;
    for (var item in imagelist) {
      if (i == 0) {
        widget.add(Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                width: 58,
                height: 57,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(item),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Image.asset(
                          assets_path + "bd6.png",
                          width: 19,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Text(
                  titlelist[i],
                  style: TextStyle(color: text_color, fontSize: 12),
                ),
              )
            ],
          ),
        ));
      } else {
        widget.add(Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(item),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                child: Text(
                  titlelist[i],
                  style: TextStyle(color: text_color, fontSize: 12),
                ),
              )
            ],
          ),
        ));
      }
      i = i + 1;
    }
    return widget;
  }

  Widget loading() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: background_color,
        width: MediaQuery.of(context).size.width,
        height: 350,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  List<Widget> meme_image() {
    List<Widget> widget = [];
    int i = 0;

    for (var i = 0; i < memeImage.length; i++) {
      widget.add(Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN1PAkNm6iq8e5anY8VjueXIcvgbl2ZKrdfw&usqp=CAU"),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Text("pokimon_ash",
                        style: TextStyle(
                            color: text_color,
                            fontFamily: 'Cardo',
                            fontWeight: FontWeight.w700)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile_screen()));
                    },
                  ),
                  Text(memeName[i],
                      style: TextStyle(
                          color: text_color,
                          fontFamily: 'Raleway Dots',
                          fontSize: 11)),
                ],
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.more_vert)))
            ],
          ),
          // Image.asset(assets_path + "demo.jpeg"),
          // Image.network(memeImage[i]),
          video_mem
              ? InkWell(
                  child: CachedNetworkImage(
                    imageUrl: memeImage[i],
                    placeholder: (context, url) => loading(),
                    // errorWidget: (context, url, error) => sIcon(Icons.error),
                  ),
                  onDoubleTap: () => setState(() {
                    likes[i] = true;
                  }),
                )
              : MyVideoPlayerPage("BigBuckBunny.mp4"),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: InkWell(
                  child: getIcon(i),
                  onTap: () {
                    setState(() {
                      if (likes[i]) {
                        likes[i] = false;
                      } else {
                        likes[i] = true;
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  assets_path + "bjh.png",
                  width: 20,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Image.asset(assets_path + "bjl.png", width: 20),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(right: 12),
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.bookmark_border),
                  ))
            ],
          ),

          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 13),
              child: Text("279 likes",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ))),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 5, bottom: 5),
              child: Row(
                children: [
                  Text("",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      )),
                  Flexible(
                      child: Html(
                          data:
                              "<b>pokimon_ash_ </b> Theres no sense in going out of your way to get somebody to like you."
                          // Text(
                          //     " There’s no sense in going out of your way to get somebody to like you.",
                          //     textAlign: TextAlign.justify,
                          //     style: TextStyle(
                          //       overflow: TextOverflow.clip,
                          //       fontWeight: FontWeight.w400,
                          )),
                ],
              ))
        ],
      ));
      video_mem = true;
    }

    return widget;
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  getJsonData() {
    rootBundle.loadString("assets/all.json").then((value) {
      var data = jsonDecode(value);
      imagelist = data["User_profiles"];
      titlelist = data["titlelist"];
      memeName = data["memeName"];
      memeImage = data["memeImage"];

      setState(() {
        circularwid();
        meme_image();
      });
    });
  }

  List<bool> likes = [false, false, false, false];

  Widget getIcon(int i) {
    if (likes[i]) {
      return Icon(Icons.favorite, color: Colors.red);
    } else {
      return Icon(Icons.favorite_border, color: Colors.black);
    }
  }

  List colorlist = [
    Colors.black,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    background_color = colorlist[1];
    text_color = colorlist[0];
    return SingleChildScrollView(
        child: Column(children: [
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: circularwid())),
      Column(
        children: meme_image(),
      )
      // loading()
    ]));
  }
}

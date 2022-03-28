import 'dart:math';

import 'package:first_live/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayerPage extends StatefulWidget {
  String asset;

  MyVideoPlayerPage(String this.asset);

  @override
  _MyVideoPlayerPageState createState() => _MyVideoPlayerPageState(asset);
}

class _MyVideoPlayerPageState extends State<MyVideoPlayerPage> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> videp_intilizer;

  String video_name;
  var list = [Icons.volume_off, Icons.volume_up];
  late var _icons;
  bool video_volume_off = false;

  _MyVideoPlayerPageState(this.video_name);

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        // VideoPlayerController.asset("assets/images/$video_name");
        VideoPlayerController.network(
            "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4");

    videp_intilizer = _videoPlayerController.initialize();
    // .then((value) {
    //   setState(() {
    //     if (_videoPlayerController.initialize() != null) {
    _videoPlayerController.play();
    //     }
    //   });
    // });
    _videoPlayerController.setLooping(false);
    _videoPlayerController.setVolume(10.0);
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _icons = list[1];
    return FutureBuilder(
        future: videp_intilizer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
                Container(
                    padding: EdgeInsets.all(8.0),
                    height: 230,
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black38,
                        child: Icon(video_volume_off ? list[0] : list[1],
                            size: 15),
                      ),
                      onTap: () {
                        setState(() {
                          if (video_volume_off) {
                            _icons = list[1];
                            _videoPlayerController.setVolume(10.0);
                            video_volume_off = false;
                          } else {
                            _icons = list[0];
                            _videoPlayerController.setVolume(0.0);
                            video_volume_off = true;
                          }
                        });
                      },
                    ))

                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         if (_videoPlayerController.value.isPlaying) {
                //           state = true;
                //           print("-------------Play");
                //           _videoPlayerController.pause();
                //         } else {
                //           _videoPlayerController.play();
                //           print("-------------pause");
                //           state = false;
                //           // icon = Icon(Icons.pause);
                //         }
                //       });
                //     },
                //     child: state ? Icon(Icons.play_arrow) : Icon(Icons.pause))
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

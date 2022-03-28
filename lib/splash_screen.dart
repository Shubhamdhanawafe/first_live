import 'dart:async';

import 'package:first_live/main_screen.dart';
import 'package:flutter/material.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) => changeActivity(timer));
  }

  void changeActivity(Timer timer) {
    timer.cancel();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => main_screen()));
  }

  @override
  Widget build(BuildContext context) {
    String assets_path = "assets/images";

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "$assets_path/splash.png",
            width: 100.0,
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    "$assets_path/btm.png",
                    width: 80,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}

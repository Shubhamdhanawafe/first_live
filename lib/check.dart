import 'package:flutter/material.dart';

class TestWala extends StatefulWidget {
  const TestWala({Key? key}) : super(key: key);

  @override
  _TestWalaState createState() => _TestWalaState();
}

class _TestWalaState extends State<TestWala> {
  var list = [Icons.volume_up, Icons.volume_off];
  var icons_;
  bool chhc = false;
  @override
  Widget build(BuildContext context) {
    icons_ = list[0];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(chhc ? list[0] : list[1]),
            // ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         if (chhc) {
            //           icons_ = list[1];
            //           chhc = false;
            //         } else {
            //           icons_ = list[0];
            //           chhc = true;
            //         }
            //       });
            //     },
            //     child: Icon(chhc ? list[0] : list[1])),
            InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(chhc ? list[0] : list[1]),
              ),
              onTap: () {
                setState(() {
                  if (chhc) {
                    icons_ = list[1];
                    chhc = false;
                  } else {
                    icons_ = list[0];
                    chhc = true;
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

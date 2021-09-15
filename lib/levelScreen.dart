import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dart:async';

class LevelScreen extends StatefulWidget {
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  double _height = 0;
  double _width = 0;

  double percent = 0.0;

  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 10), (_) {
      setState(() {
        percent += 0.1;
        if (percent >= 1) {
          timer?.cancel();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Color(0xff153244),
        height: _height,
        width: _width,
        //padding: EdgeInsets.all(20),
        child: Container(
          child: LiquidCustomProgressIndicator(
            value: percent / 100,
            valueColor: AlwaysStoppedAnimation(Colors.cyan),
            backgroundColor: Color(0xff153244),
            direction: Axis.vertical,
            shapePath: _buildBoatPath(),
            center: Text(
              percent.toInt().toString() + "%",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      //],
      // children: [
      //   // Column(
      //   //   children: [
      //   //     Text(
      //   //       'Liquid circular progress indicator',
      //   //       style: TextStyle(
      //   //           fontStyle: FontStyle.italic,
      //   //           fontWeight: FontWeight.w700,
      //   //           fontSize: 15),
      //   //     ),
      //   //     SizedBox(height: 40),
      //   //     Container(
      //   //       height: 130,
      //   //       width: 130,
      //   //       child: LiquidCircularProgressIndicator(
      //   //         value: percent / 100,
      //   //         valueColor: AlwaysStoppedAnimation(Colors.pink),
      //   //         backgroundColor: Colors.white,
      //   //         borderColor: Colors.red,
      //   //         borderWidth: 4.0,
      //   //         direction: Axis.vertical,
      //   //         center: Text(
      //   //           percent.toString() + "%",
      //   //           style: TextStyle(
      //   //               fontStyle: FontStyle.italic,
      //   //               fontWeight: FontWeight.w700,
      //   //               fontSize: 12.0,
      //   //               color: Colors.black),
      //   //         ),
      //   //       ),
      //   //     ),
      //   //   ],
      //   // ),
      //   Column(
      //     //place here
      //   )
      // ],
    );
    //),
    //);
  }

  Path _buildBoatPath() {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, 900)
      ..lineTo(450, 900)
      ..lineTo(450, 0)
      ..close();
  }
}

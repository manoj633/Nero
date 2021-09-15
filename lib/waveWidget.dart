import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'dart:async';

class WaveDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WaveDemoHomePage(title: 'Wave Demo'),
    );
  }
}

class WaveDemoHomePage extends StatefulWidget {
  WaveDemoHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WaveDemoHomePageState createState() => _WaveDemoHomePageState();
}

class _WaveDemoHomePageState extends State<WaveDemoHomePage> {
  double percent = 1.0;

  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 100), (_) {
      setState(() {
        percent -= 0.005;
        print(percent);
        if (percent <= 0.0) {
          timer?.cancel();
        }
      });
    });
    super.initState();
  }

  _buildCard({
    required Config config,
    Color backgroundColor = Colors.transparent,
    DecorationImage? backgroundImage,
    double height = 780,
  }) {
    return Stack(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Color(0xFF153244),
            height: height,
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: WaveWidget(
                config: config,
                backgroundColor: backgroundColor,
                backgroundImage: backgroundImage,
                size: Size(double.infinity, double.infinity),
                waveAmplitude: 0,
              ),
            ),
          ),
          Positioned(
            bottom: 350,
            left: 160,
            child: Text(
              (100 - percent * 100).toInt().toString() + "%",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.black),
            ),
          ),
        ]);
  }

  MaskFilter? _blur;
  final List<MaskFilter> _blurs = [
    MaskFilter.blur(BlurStyle.normal, 10.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  // int _blurIndex = 0;
  // MaskFilter _nextBlur() {
  //   if (_blurIndex == _blurs.length - 1) {
  //     _blurIndex = 0;
  //   } else {
  //     _blurIndex = _blurIndex + 1;
  //   }
  //   _blur = _blurs[_blurIndex];
  //   return _blurs[_blurIndex];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            _buildCard(
                config: CustomConfig(
                  colors: [
                    Color(0xB32196F3), //b3
                    Color(0x8A2196F3), //8a
                    Color(0x4D2196F3), //4d
                    Color(0x3D2196F3), //3d
                  ],
                  durations: [18000, 8000, 5000, 12000],
                  heightPercentages: [
                    // 0.25, 0.26, 0.28, 0.31
                    percent,
                    percent + 0.01,
                    percent + 0.03,
                    percent + 0.06
                  ],
                  blur: _blur,
                ),
                backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}

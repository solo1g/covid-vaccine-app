import 'dart:async';
import 'dart:math';
import 'package:covidvaccineapp/screens/Signin_up.dart';
import 'package:covidvaccineapp/screens/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SplashScreenController extends StatefulWidget {
  @override
  _SplashScreenControllerState createState() => _SplashScreenControllerState();
}

class _SplashScreenControllerState extends State<SplashScreenController> {
  final _auth = FirebaseAuth.instance;
  List<Widget> pages = [
    SplashScreen(),
  ];
  LiquidController _liquidController;
  @override
  void initState() {
    super.initState();
    pages.add(
      _auth.currentUser == null ? Sign() : NavigationHomeScreen(),
    );
    _liquidController = LiquidController();
    startTransition();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //To improve performance on dev builds. May not be required on release build.
    precacheImage(AssetImage("Assets/image2.jpg"), context);
  }

  void startTransition() {
    //Do not change delays. High delays in dev build due to poor performance
    //on emulator. Will be changed in final build.
    Timer(Duration(seconds: 2), () {
      _liquidController.animateToPage(page: 1, duration: 3000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: pages,
      liquidController: _liquidController,
      disableUserGesture: true,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Transform.rotate(
                angle: pi,
                child: Center(
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [Colors.red, Color(0xEEF44336)],
                        [Colors.red[800], Color(0x77E57373)],
                        [Colors.orange, Color(0x66FF9800)],
                        [Color(0xff07689f), Color(0x885d54a4)]
                      ],
                      durations: [15000, 9440, 6800, 4000],
                      heightPercentages: [0.35, 0.40, 0.45, 0.50],
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    size: Size.infinite,
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ),
            Expanded(
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.red, Color(0xEEF44336)],
                    [Colors.red[800], Color(0x77E57373)],
                    [Colors.orange, Color(0x66FF9800)],
                    [Color(0xff5d54a4), Color(0x885d54a4)]
                  ],
                  durations: [14000, 12440, 10800, 6000],
                  heightPercentages: [0.34, 0.37, 0.41, 0.45],
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                size: Size.infinite,
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

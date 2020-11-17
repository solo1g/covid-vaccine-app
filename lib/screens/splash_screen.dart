import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import './signin_up.dart';
import './navigation.dart';
import '../state_models/covid_details_data.dart';
import '../state_models/user_details_data.dart';

// class SplashScreenController extends StatefulWidget {
//   static const routeName = "/splash-screen-controller";
//   @override
//   _SplashScreenControllerState createState() => _SplashScreenControllerState();
// }

// class _SplashScreenControllerState extends State<SplashScreenController> {
//   final _auth = FirebaseAuth.instance;

//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   //To improve performance on dev builds. May not be required on release build.
//   //   precacheImage(AssetImage("Assets/image2.jpg"), context);
//   // }

//   void startTransition() {
//     //Do not change delays. High delays in dev build due to poor performance
//     //on emulator. Will be changed in final build.
//     Navigator.pushNamedAndRemoveUntil(
//         context,
//         _auth.currentUser == null
//             ? Sign.routeName
//             : NavigationHomeScreen.routeName,
//         (route) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if ((_auth.currentUser == null || context.watch<UserData>().isReady) &&
//         context.watch<CovidData>().isReady) startTransition();
//   }
// }

class SplashScreenController extends StatefulWidget {
  static const routeName = "/splash-screen";
  @override
  _SplashScreenControllerState createState() => _SplashScreenControllerState();
}

class _SplashScreenControllerState extends State<SplashScreenController> {
  final _auth = FirebaseAuth.instance;
  bool _loaded = false;

  void startTransition() async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      _auth.currentUser == null
          ? Sign.routeName
          : NavigationHomeScreen.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Todo: this is quite a contraption for a simple task. Fix this.
    _loaded = context.watch<CovidData>().isReady &&
        (_auth.currentUser == null || context.watch<UserData>().isReady);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_loaded) startTransition();
    });
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
        Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.black.withOpacity(0.5)),
            height: 200,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Image.asset(
                  'Assets/app_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

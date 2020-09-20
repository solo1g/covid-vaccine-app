import 'dart:async';

import 'package:covidvaccineapp/screens/Signin_up.dart';
import 'package:covidvaccineapp/screens/navigation.dart';
import 'package:covidvaccineapp/widgets/home/tips.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  List<Widget> pages = [
    Container(
      color: Color(0xFF473F97),
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(300),
          ),
          child: Image.asset(
            "Assets/app_logo.png",
            scale: 0.2,
          ),
        ),
      ),
    ),
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
    precacheImage(AssetImage("Assets/app_logo.png"), context);
    precacheImage(AssetImage("Assets/image2.jpg"), context);
  }

  void startTransition() {
    //Do not change delays. High delays in dev build due to poor performance
    //on emulator. Will be changed in final build.
    Timer(Duration(milliseconds: 0), () {
      _liquidController.animateToPage(page: 1, duration: 1000);
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

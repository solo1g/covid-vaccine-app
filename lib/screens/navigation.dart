import 'package:flutter/material.dart';

import '../widgets/home/app_drawer.dart';
import 'homescreen.dart';
import '../widgets/home/app_drawer_controller.dart';
import 'user_registration_details.dart';
import './navigation/helpscreen.dart';
import './navigation/feedback.dart';
import './navigation/rateapp.dart';
import './navigation/aboutus.dart';

class NavigationHomeScreen extends StatefulWidget {
  static const routeName = '/navhome';

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: AppDrawer(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        if (mounted)
          setState(() {
            screenView = HomeScreen();
          });
      } else if (drawerIndex == DrawerIndex.Help) {
        if (mounted)
          setState(() {
            screenView = Help();
          });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        if (mounted)
          setState(() {
            screenView = Feedbackform();
          });
      } else if (drawerIndex == DrawerIndex.Update) {
        if (mounted)
          setState(() {
            screenView = UserDetailsStepper();
          });
      } else if (drawerIndex == DrawerIndex.Share) {
        if (mounted)
          setState(() {
            screenView = Rateapp();
          });
      } else if (drawerIndex == DrawerIndex.About) {
        if (mounted)
          setState(() {
            screenView = AboutUs();
          });
      } else {
        //do in your way......
      }
    }
  }
}

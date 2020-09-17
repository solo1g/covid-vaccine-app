import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../ui/DailyCases.dart';
import '../widgets/home/HomeScreenWidgets.dart';
import 'dart:math';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showSpinner;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  /*
  NO NEED TO OPTIMISE CODE. THIS IS JUST TEMPORARY AND I WILL OPTIMISE LATER.
   */
  Map<String, dynamic> userData = {};
  Map<String, dynamic> userAnalysis = {};
  @override
  void initState() {
    super.initState();
    showSpinner = true;
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    var doc = await _firestore
        .collection("UserDetails")
        .doc(_auth.currentUser.email)
        .get();
    setState(() {
      userData = doc.data();
      userAnalysis = getUserAnalysis(userData);
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Covid app"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: susceptibilityPercent("Susceptibility",
                      userAnalysis["x"] == null ? 0.0 : userAnalysis["x"]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(60),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  // TODO: modifu ui elements of DailyCases class
                  child: DailyCases(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, dynamic> getUserAnalysis(Map<String, dynamic> userData) {
  //if you expected something better prepare to be disappointed
  Map<String, dynamic> analysis = {};
  analysis["x"] = min(100.0, double.parse(userData["weight"]) / 100.0);
  return analysis;
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../ui/DailyCases.dart';
import '../widgets/home/HomeScreenWidgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  /*
  NO NEED TO OPTIMISE CODE. THIS IS JUST TEMPORARY AND I WILL OPTIMISE LATER.
   */
  String name;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    var doc = await _firestore
        .collection("UserDetails")
        .doc(_auth.currentUser.email)
        .get();
    print(doc.data());
    setState(() {
      name = doc.data()["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: name == null
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Hello $name"),
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
                padding: const EdgeInsets.all(16.0),
                child: susceptibilityPercent("Susceptibility", 0.237),
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
    );
  }
}

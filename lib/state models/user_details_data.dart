import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserData with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Map<String, dynamic> userData;
  Map<String, dynamic> userAnalysis;
  bool isReady;

  UserData() {
    updateData();
  }

  Future<void> updateData() async {
    isReady = false;
    print("Fetching user data");
    await _firestore
        .collection("UserDetails")
        .doc(_auth.currentUser.email)
        .get()
        .then((value) => userData = value.data())
        .catchError((e) => throw Exception("Server failure"))
        .timeout(Duration(seconds: 10),
            onTimeout: () => throw Exception("No internet"))
        .whenComplete(() {
      userAnalysis = _getUserAnalysis(userData);
      notifyListeners();
      print("User data updated");
      isReady = true;
    });
  }

  Map<String, dynamic> _getUserAnalysis(Map<String, dynamic> userData) {
    //if you expected something better prepare to be disappointed
    Map<String, dynamic> analysis = {};
    analysis["x"] = min(100.0, double.parse(userData["weight"]) / 100.0);
    return analysis;
  }
}

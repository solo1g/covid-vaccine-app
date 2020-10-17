import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

class UserData with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Map<String, dynamic> userData;
  Map<String, dynamic> userAnalysis;
  Position userLocation;
  bool isReady;

  UserData() {
    updateData();
  }

  Future<void> updateData() async {
    //todo: temporary fix. need to remove
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
        .whenComplete(() async {
      userAnalysis = _getUserAnalysis(userData);
      notifyListeners();
      //Todo: merge location parameter in userData itself
      print("User data updated");
      await updateLocation();
      isReady = true;
      notifyListeners();
    });
  }

  Future<void> updateLocation() async {
    print("Fetching location");
    try {
      userLocation =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print("Location found as ${userLocation.toString()}");
    } catch (e) {
      print(e.toString());
      print("Using default location");
      userLocation =
          Position(latitude: 37.43296265331129, longitude: -122.08832357078792);
    }
  }

  Map<String, dynamic> _getUserAnalysis(Map<String, dynamic> userData) {
    //if you expected something better prepare to be disappointed
    Map<String, dynamic> analysis = {};
    analysis["x"] = min(100.0, double.parse(userData["weight"]) / 100.0);
    return analysis;
  }
}

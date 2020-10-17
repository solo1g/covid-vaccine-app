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
    //todo: temporary fix. need to remove
    try {
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
    } catch (e) {
      isReady = true;
    }
  }

  Map<String, dynamic> _getUserAnalysis(Map<String, dynamic> userData) {
    //if you expected something better prepare to be disappointed
    Map<String, dynamic> analysis = {};
     double rv = 1.0,
      weight,
      height,
      bmi,age;


    //age factor to be added later
    /*
   if(age<40)
   rv=rv*0.07;
   else if(age<50)
   rv=rv*0.31;
   else if(age<60)
   rv=rv*1;
   else if(age<70)
   rv=rv*2.09;
   else if(age<80)
   rv=rv*4.77;
   else 
   rv=rv*12.64;
   */


  weight = double.parse(userData["weight"]);
  height = double.parse(userData["height"]);
  bmi = weight / (height * height) * 10000;
  if (bmi < 30)
    rv = rv;
  else if (bmi < 35)
    rv = rv * 1.27;
  else if (bmi < 40)
    rv = rv * 1.56;
  else
    rv = rv * 2.27;
  if (userData['gender'] == "Male") rv = rv * 1.99;

  //disease
  if (userData["asthma"] == true) rv = rv * 1.11;
  if (userData["kidney"] == true) rv = rv * 1.72;
  if (userData["immunesystem"] == true) rv = rv * 1.67;
  if (userData["heart"] == true) rv = rv * 1.27;
  if (userData["diabetes"] == true) rv = rv * 1.87;
  if (userData["hypertension"] == true) rv = rv * 0.95;
  if (userData["liver"] == true) rv = rv * 1.61;
  //return rv;s

  analysis["x"] = rv;
   
     print('The value of the risk factor is: $rv');
  }
}

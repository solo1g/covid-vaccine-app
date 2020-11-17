import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart' as G;
import 'package:google_maps_webservice/places.dart' as P;
import 'package:location/location.dart';

import '../main.dart';

//Todo: change name P to something better

class UserData with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Map<String, dynamic> userData;
  Map<String, dynamic> userAnalysis;
  LocationData userLocation;
  P.GoogleMapsPlaces _places =
      P.GoogleMapsPlaces(apiKey: "AIzaSyCCZM1amtgpElcXCqyOOkYKz5deQsminak");
  P.PlacesSearchResponse nearbyHospitals;
  G.Placemark userPlacemark;
  int rank;
  int daysToVaccine;
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
      userAnalysis = getUserAnalysis(userData);
      notifyListeners();
      //Todo: merge location parameter in userData itself
      print("User data updated");
      await updateLocation();
      await geodecodeLocation();
      await updateNearbyHospitals();
      await syncRank();
      updateDaysToVaccine();
      isReady = true;
      notifyListeners();
    });
  }

  Future<void> geodecodeLocation() async {
    try {
      print("Decoding Location");
      await G
          .placemarkFromCoordinates(
              userLocation.latitude, userLocation.longitude)
          .then((value) => userPlacemark = value.first);
      print(userPlacemark);
      print("Location decoded");
    } catch (e) {
      print("Error in decoding. ${e.toString()}");
    }
  }

  Future<void> updateLocation() async {
    print("Fetching location");
    try {
      Location location = Location();
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      userLocation = await location.getLocation();
      print("Location found as ${userLocation.toString()}");
    } catch (e) {
      print(e.toString());
      print("Using default location");
      final defaultMap = {
        "latitude": 37.43296265331129,
        "longitude": -122.08832357078792
      };
      userLocation = LocationData.fromMap(defaultMap);
    }
  }

  void updateDaysToVaccine() {
    print("Updating days to get vaccine");
    // No vaccine made. What can I do?
  }

  Future<void> updateNearbyHospitals() async {
    try {
      print("Fetching hostpitals");
      nearbyHospitals = await _places.searchNearbyWithRankBy(
          P.Location(userLocation.latitude, userLocation.longitude), "distance",
          type: "hospital");
      print("Hospitals fetched");
    } catch (e) {
      print("Error in getting hospitals. ${e.toString()}");
    }
  }

  Future<void> syncRank() async {
    //Todo: Refactor it. This should not be done how it is done here but the code is all messed up.
    try {
      print("Updating rank");
      await _firestore
          .collection("UserDetails")
          .doc(_auth.currentUser.email)
          .set(
              {"sortVal": userAnalysis["riskFactor"]}, SetOptions(merge: true));
      var query = _firestore
          .collection("UserDetails")
          .where("sortVal", isGreaterThan: userAnalysis["riskFactor"]);
      //Todo: this fetched ALL documents. Again not the most optimal way. Fix later or idc.
      await query.get().then((value) {
        value.docs.forEach((element) {
          print(element.data());
        });
        rank = 1 + value.docs.length;
      });
      print("Rank updated. Rank is $rank");
    } catch (e) {
      print("Cannot get rank. Assigning 42. ${e.toString()}");
      rank = 42;
    }
  }

  static Map<String, dynamic> getUserAnalysis(Map<String, dynamic> userData) {
    //if you expected something better prepare to be disappointed
    Map<String, dynamic> analysis = {};
    double rv = 1.0, weight, height, bmi, temp;
    double age =
        DateTime.now().difference(userData["birthdate"].toDate()).inDays /
            365.0;
    temp = rv;
    if (age < 40)
      rv = rv * 0.07;
    else if (age < 50)
      rv = rv * 0.31;
    else if (age < 60)
      rv = rv * 1;
    else if (age < 70)
      rv = rv * 2.09;
    else if (age < 80)
      rv = rv * 4.77;
    else
      rv = rv * 12.64;
    double age_f = rv - temp;
    weight = double.parse(userData["weight"]);
    height = double.parse(userData["height"]);
    bmi = weight / (height * height) * 10000;
    temp = rv;
    if (bmi < 30)
      rv = rv;
    else if (bmi < 35)
      rv = rv * 1.27;
    else if (bmi < 40)
      rv = rv * 1.56;
    else
      rv = rv * 2.27;
    double bmi_f = rv - temp;
    temp = rv;
    if (userData['gender'] == "Male") rv = rv * 1.99;
    double gender_f = rv - temp;
    temp = rv;
    //disease
    if (userData["asthma"] == true) rv = rv * 1.11;
    double asthma_f = rv - temp;
    temp = rv;
    if (userData["kidney"] == true) rv = rv * 1.72;
    double kidney_f = rv - temp;
    temp = rv;
    if (userData["immunesystem"] == true) rv = rv * 1.67;
    double immunesystem_f = rv - temp;
    temp = rv;
    if (userData["heart"] == true) rv = rv * 1.27;
    double heart_f = rv - temp;
    temp = rv;
    if (userData["diabetes"] == true) rv = rv * 1.87;
    double diabetes_f = rv - temp;
    temp = rv;
    if (userData["hypertension"] == true) rv = rv * 0.95;
    double hypertension_f = rv - temp;
    temp = rv;
    if (userData["liver"] == true) rv = rv * 1.61;
    double liver_f = rv - temp;
    temp = rv;
    //return rv;s
    temp = rv - 1;
    age_f /= temp;
    bmi_f /= temp;
    gender_f /= temp;
    asthma_f /= temp;
    kidney_f /= temp;
    heart_f /= temp;
    immunesystem_f /= temp;
    diabetes_f /= temp;
    hypertension_f /= temp;
    liver_f /= temp;
    List<List<dynamic>> sortedFactors = [];
    analysis["age"] = age_f;
    sortedFactors.add(["Age", age_f]);
    analysis["bmi"] = bmi_f;
    sortedFactors.add(["BMI", bmi_f]);
    analysis["gender"] = gender_f;
    sortedFactors.add(["Gender", gender_f]);
    analysis["asthma"] = asthma_f;
    sortedFactors.add(["Asthma", asthma_f]);
    analysis["heart"] = heart_f;
    sortedFactors.add(["Heart", heart_f]);
    analysis["kidney"] = kidney_f;
    sortedFactors.add(["Kidney", kidney_f]);
    analysis["immune system"] = immunesystem_f;
    sortedFactors.add(["Immune System", immunesystem_f]);
    analysis["hypertension"] = hypertension_f;
    sortedFactors.add(["Hypertension", hypertension_f]);
    analysis["diabetes"] = diabetes_f;
    sortedFactors.add(["Diabetes", diabetes_f]);
    analysis["asthma"] = asthma_f;
    sortedFactors.add(["Asthma", asthma_f]);
    sortedFactors.sort((a, b) => b[1].compareTo(a[1]));
    analysis["sorted"] = sortedFactors;
    analysis["riskFactor"] = rv;
    print('The value of the risk factor is: $rv');
    analysis["riskFactorClamped"] = tan(rv * pi / 2);
    if (!(analysis["riskFactorClamped"] >= 0 &&
        analysis["riskFactorClamped"] <= 1)) {
      print(
          "riskFactorClamped value out of range. Value if ${analysis["riskFactorClamped"]}. Assigning 0.2");
      analysis["riskFactorClamped"] = 0.2;
    }
    print(analysis);
    return analysis;
  }
}

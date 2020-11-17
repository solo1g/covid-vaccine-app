import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/daily_cases_model.dart';

class CovidData with ChangeNotifier {
  DailyCaseDataModel covidData;
  bool isReady;

  CovidData() {
    updateData();
  }

  Future<void> updateData() async {
    isReady = false;
    print("Fetching covid data");
    final response = await http.get('https://api.covid19india.org/data.json');
    if (response.statusCode == 200) {
      covidData = DailyCaseDataModel.fromJson(json.decode(response.body));
      print("Updated covid Data");
      isReady = true;
      notifyListeners();
    } else {
      throw Exception('No internet.');
    }
  }
}

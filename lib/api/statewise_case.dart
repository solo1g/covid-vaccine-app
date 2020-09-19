import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/states_daily.dart';

class StateDaily {
  List<Statewise> statewise;

  StateDaily({this.statewise});

  StateDaily.fromJson(Map<String, dynamic> json) {
    if (json['statewise'] != null) {
      statewise = new List<Statewise>();
      json['statewise'].forEach((v) {
        statewise.add(new Statewise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statewise != null) {
      data['statewise'] = this.statewise.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

Future<StateDaily> fetchCaseData() async {
  final response =
      await http.get('https://api.covid19india.org/states_daily.json');
  if (response.statusCode == 200) {
    return StateDaily.fromJson(json.decode(response.body));
  } else {
    throw Exception('No internet.');
  }
}

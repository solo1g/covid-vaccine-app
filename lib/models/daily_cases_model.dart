import 'dart:convert';
import 'package:http/http.dart' as http;

import 'case_time_series.dart';
import 'statewise.dart';
import 'tested.dart';

class DailyCaseDataModel {
  List<CasesTimeSeries> casesTimeSeries;
  List<Statewise> statewise;
  List<Tested> tested;

  DailyCaseDataModel({this.casesTimeSeries, this.statewise, this.tested});

  DailyCaseDataModel.fromJson(Map<String, dynamic> json) {
    if (json['cases_time_series'] != null) {
      casesTimeSeries = new List<CasesTimeSeries>();
      json['cases_time_series'].forEach((v) {
        casesTimeSeries.add(new CasesTimeSeries.fromJson(v));
      });
    }
    if (json['statewise'] != null) {
      statewise = new List<Statewise>();
      json['statewise'].forEach((v) {
        statewise.add(new Statewise.fromJson(v));
      });
    }
    if (json['tested'] != null) {
      tested = new List<Tested>();
      json['tested'].forEach((v) {
        tested.add(new Tested.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.casesTimeSeries != null) {
      data['cases_time_series'] =
          this.casesTimeSeries.map((v) => v.toJson()).toList();
    }
    if (this.statewise != null) {
      data['statewise'] = this.statewise.map((v) => v.toJson()).toList();
    }
    if (this.tested != null) {
      data['tested'] = this.tested.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

Future<DailyCaseDataModel> fetchCaseData() async {
  final response = await http.get('https://api.covid19india.org/data.json');
  if (response.statusCode == 200) {
    return DailyCaseDataModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('No internet.');
  }
}

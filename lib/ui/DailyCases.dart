import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/case_time_series.dart';
import '../models/statewise.dart';
import '../models/tested.dart';

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

class DailyCases extends StatefulWidget {
  @override
  _DailyCasesState createState() => _DailyCasesState();
}

class _DailyCasesState extends State<DailyCases> {
  Future<DailyCaseDataModel> futureData;
  @override
  void initState() {
    futureData = fetchCaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DailyCaseDataModel>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var today = snapshot.data.casesTimeSeries.last;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Daily cases",
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${today.dailyconfirmed}",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Daily recoveries",
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${today.dailyrecovered}",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Daily deaths",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${today.dailydeceased}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("Error occured");
        }
        return Text("Loading...");
      },
    );
  }
}

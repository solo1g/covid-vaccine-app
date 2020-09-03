import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class CasesTimeSeries {
  String dailyconfirmed;
  String dailydeceased;
  String dailyrecovered;
  String date;
  String totalconfirmed;
  String totaldeceased;
  String totalrecovered;

  CasesTimeSeries(
      {this.dailyconfirmed,
      this.dailydeceased,
      this.dailyrecovered,
      this.date,
      this.totalconfirmed,
      this.totaldeceased,
      this.totalrecovered});

  CasesTimeSeries.fromJson(Map<String, dynamic> json) {
    dailyconfirmed = json['dailyconfirmed'];
    dailydeceased = json['dailydeceased'];
    dailyrecovered = json['dailyrecovered'];
    date = json['date'];
    totalconfirmed = json['totalconfirmed'];
    totaldeceased = json['totaldeceased'];
    totalrecovered = json['totalrecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyconfirmed'] = this.dailyconfirmed;
    data['dailydeceased'] = this.dailydeceased;
    data['dailyrecovered'] = this.dailyrecovered;
    data['date'] = this.date;
    data['totalconfirmed'] = this.totalconfirmed;
    data['totaldeceased'] = this.totaldeceased;
    data['totalrecovered'] = this.totalrecovered;
    return data;
  }
}

class Statewise {
  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;

  Statewise(
      {this.active,
      this.confirmed,
      this.deaths,
      this.deltaconfirmed,
      this.deltadeaths,
      this.deltarecovered,
      this.lastupdatedtime,
      this.migratedother,
      this.recovered,
      this.state,
      this.statecode,
      this.statenotes});

  Statewise.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    deltaconfirmed = json['deltaconfirmed'];
    deltadeaths = json['deltadeaths'];
    deltarecovered = json['deltarecovered'];
    lastupdatedtime = json['lastupdatedtime'];
    migratedother = json['migratedother'];
    recovered = json['recovered'];
    state = json['state'];
    statecode = json['statecode'];
    statenotes = json['statenotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['deltaconfirmed'] = this.deltaconfirmed;
    data['deltadeaths'] = this.deltadeaths;
    data['deltarecovered'] = this.deltarecovered;
    data['lastupdatedtime'] = this.lastupdatedtime;
    data['migratedother'] = this.migratedother;
    data['recovered'] = this.recovered;
    data['state'] = this.state;
    data['statecode'] = this.statecode;
    data['statenotes'] = this.statenotes;
    return data;
  }
}

class Tested {
  String dailyrtpcrtests;
  String individualstestedperconfirmedcase;
  String positivecasesfromsamplesreported;
  String samplereportedtoday;
  String source;
  String source1;
  String source3;
  String testedasof;
  String testpositivityrate;
  String testsconductedbyprivatelabs;
  String testsperconfirmedcase;
  String testspermillion;
  String totalindividualstested;
  String totalpositivecases;
  String totalrtpcrtests;
  String totalsamplestested;
  String updatetimestamp;

  Tested(
      {this.dailyrtpcrtests,
      this.individualstestedperconfirmedcase,
      this.positivecasesfromsamplesreported,
      this.samplereportedtoday,
      this.source,
      this.source1,
      this.source3,
      this.testedasof,
      this.testpositivityrate,
      this.testsconductedbyprivatelabs,
      this.testsperconfirmedcase,
      this.testspermillion,
      this.totalindividualstested,
      this.totalpositivecases,
      this.totalrtpcrtests,
      this.totalsamplestested,
      this.updatetimestamp});

  Tested.fromJson(Map<String, dynamic> json) {
    dailyrtpcrtests = json['dailyrtpcrtests'];
    individualstestedperconfirmedcase =
        json['individualstestedperconfirmedcase'];
    positivecasesfromsamplesreported = json['positivecasesfromsamplesreported'];
    samplereportedtoday = json['samplereportedtoday'];
    source = json['source'];
    source1 = json['source1'];
    source3 = json['source3'];
    testedasof = json['testedasof'];
    testpositivityrate = json['testpositivityrate'];
    testsconductedbyprivatelabs = json['testsconductedbyprivatelabs'];
    testsperconfirmedcase = json['testsperconfirmedcase'];
    testspermillion = json['testspermillion'];
    totalindividualstested = json['totalindividualstested'];
    totalpositivecases = json['totalpositivecases'];
    totalrtpcrtests = json['totalrtpcrtests'];
    totalsamplestested = json['totalsamplestested'];
    updatetimestamp = json['updatetimestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyrtpcrtests'] = this.dailyrtpcrtests;
    data['individualstestedperconfirmedcase'] =
        this.individualstestedperconfirmedcase;
    data['positivecasesfromsamplesreported'] =
        this.positivecasesfromsamplesreported;
    data['samplereportedtoday'] = this.samplereportedtoday;
    data['source'] = this.source;
    data['source1'] = this.source1;
    data['source3'] = this.source3;
    data['testedasof'] = this.testedasof;
    data['testpositivityrate'] = this.testpositivityrate;
    data['testsconductedbyprivatelabs'] = this.testsconductedbyprivatelabs;
    data['testsperconfirmedcase'] = this.testsperconfirmedcase;
    data['testspermillion'] = this.testspermillion;
    data['totalindividualstested'] = this.totalindividualstested;
    data['totalpositivecases'] = this.totalpositivecases;
    data['totalrtpcrtests'] = this.totalrtpcrtests;
    data['totalsamplestested'] = this.totalsamplestested;
    data['updatetimestamp'] = this.updatetimestamp;
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

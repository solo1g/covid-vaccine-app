import 'package:flutter/material.dart';

import '../../api/DailyCases.dart' as dailycases;

class DailyCases extends StatefulWidget {
  @override
  _DailyCasesState createState() => _DailyCasesState();
}

class _DailyCasesState extends State<DailyCases> {
  Future<dailycases.DailyCaseDataModel> futureData;
  @override
  void initState() {
    futureData = dailycases.fetchCaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dailycases.DailyCaseDataModel>(
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

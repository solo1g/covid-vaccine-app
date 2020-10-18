import 'package:flutter/material.dart';

import '../../models/daily_cases_model.dart' as dailycases;

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
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Daily cases",
                      style: TextStyle(color: Colors.red, fontSize: 15),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Daily recoveries",
                      style: TextStyle(color: Colors.green, fontSize: 15),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Daily deaths",
                      style: TextStyle(color: Colors.black, fontSize: 15),
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

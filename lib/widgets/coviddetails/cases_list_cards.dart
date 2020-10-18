import 'package:flutter/material.dart';

import '../../models/daily_cases_model.dart' as dailycases;

enum Location {
  India,
  My_state,
}

enum Date {
  Total,
  Today,
  Yesterday,
}

class CasesListCards extends StatefulWidget {
  final Location location;
  final Date date;

  CasesListCards({
    this.location,
    this.date,
  });

  @override
  _CasesListCardsState createState() => _CasesListCardsState();
}

class _CasesListCardsState extends State<CasesListCards> {
  Future<dailycases.DailyCaseDataModel> futureNationalData;
  var cases;
  var death;
  var recovered;
  var active;

  @override
  void initState() {
    futureNationalData = dailycases.fetchCaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dailycases.DailyCaseDataModel>(
      future: futureNationalData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (widget.location == Location.India && widget.date == Date.Total) {
            cases = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .confirmed;
            death = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .deaths;
            recovered = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .recovered;
            active = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .active;
          } else if (widget.location == Location.India &&
              widget.date == Date.Today) {
            cases = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .deltaconfirmed;
            death = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .deltadeaths;
            recovered = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .deltarecovered;
            active = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "TT")
                .deltaconfirmed;
          } else if (widget.location == Location.India &&
              widget.date == Date.Yesterday) {
            cases = snapshot.data.casesTimeSeries.last.dailyconfirmed;
            death = snapshot.data.casesTimeSeries.last.dailydeceased;
            recovered = snapshot.data.casesTimeSeries.last.dailyrecovered;
            active = snapshot.data.casesTimeSeries.last.dailyconfirmed;
          } else if (widget.location == Location.My_state &&
              widget.date == Date.Total) {
            cases = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .confirmed;
            death = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .deaths;
            recovered = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .recovered;
            active = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .active;
          } else if (widget.location == Location.My_state &&
              widget.date == Date.Today) {
            cases = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .deltaconfirmed;
            death = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .deltadeaths;
            recovered = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .deltarecovered;
            active = snapshot.data.statewise
                .firstWhere((ele) => ele.statecode == "DL")
                .deltaconfirmed;
          }
          // var total = snapshot.data.statewise.first;
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildCasesCard('Total Cases', '$cases', Colors.orange),
                      _buildCasesCard('Death', '$death', Colors.red),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildCasesCard('Recovered', '$recovered', Colors.green),
                      _buildCasesCard('Active', '$active', Colors.lightBlue),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error occured");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Expanded _buildCasesCard(String title, String count, MaterialColor color) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color.shade400,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          Text(
            count,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

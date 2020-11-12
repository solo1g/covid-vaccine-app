import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../models/daily_cases_model.dart' as dailycases;
import '../../models/state_map.dart';
// import '../../state_models/user_details_data.dart';
import '../../state_models/covid_details_data.dart';

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
  final String state;

  CasesListCards({this.location, this.date, this.state});

  @override
  _CasesListCardsState createState() => _CasesListCardsState();
}

class _CasesListCardsState extends State<CasesListCards> {
  var cases;
  var death;
  var recovered;
  var active;
  var statecode;

  @override
  Widget build(BuildContext context) {
    statecode = state_map.entries
        .firstWhere((element) => element.key == widget.state)
        .value
        .toString();
    if (context.watch<CovidData>().isReady) {
      if (widget.location == Location.India && widget.date == Date.Total) {
        cases = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .confirmed;
        death = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .deaths;
        recovered = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .recovered;
        active = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .active;
      } else if (widget.location == Location.India &&
          widget.date == Date.Today) {
        cases = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .deltaconfirmed;
        death = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .deltadeaths;
        recovered = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .deltarecovered;
        active = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == "TT")
            .deltaconfirmed;
      } else if (widget.location == Location.India &&
          widget.date == Date.Yesterday) {
        cases = context
            .watch<CovidData>()
            .covidData
            .casesTimeSeries
            .last
            .dailyconfirmed;
        death = context
            .watch<CovidData>()
            .covidData
            .casesTimeSeries
            .last
            .dailydeceased;
        recovered = context
            .watch<CovidData>()
            .covidData
            .casesTimeSeries
            .last
            .dailyrecovered;
        active = context
            .watch<CovidData>()
            .covidData
            .casesTimeSeries
            .last
            .dailyconfirmed;
      } else if (widget.location == Location.My_state &&
          widget.date == Date.Total) {
        cases = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
            .confirmed;
        death = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
            .deaths;
        recovered = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
            .recovered;
        active = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
            .active;
      } else if (widget.location == Location.My_state &&
          widget.date == Date.Today) {
        cases = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
            .deltaconfirmed;
        death = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
            .deltadeaths;
        recovered = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
            .deltarecovered;
        active = context
            .watch<CovidData>()
            .covidData
            .statewise
            .firstWhere((ele) => ele.statecode == statecode)
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
    } else if (!context.watch<CovidData>().isReady) {
      return Center(
        child: Text(
          "Loading...",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
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

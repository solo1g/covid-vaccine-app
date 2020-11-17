import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../../state_models/covid_details_data.dart';

class StateActiveCases {
  String name;
  int active;

  StateActiveCases({this.name, this.active});
}

class StateBarChart extends StatefulWidget {
  @override
  _StateBarChartState createState() => _StateBarChartState();
}

class _StateBarChartState extends State<StateBarChart> {
  List<StateActiveCases> stateActive = [];

  @override
  Widget build(BuildContext context) {
    if (context.watch<CovidData>().isReady) {
      context.watch<CovidData>().covidData.statewise.forEach((element) {
        stateActive.add(StateActiveCases(
            name: element.statecode, active: int.parse(element.active)));
      });
      stateActive.sort((a, b) => a.active.compareTo(b.active));
      // print(stateActive.toString());
      stateActive = stateActive.reversed.toList().sublist(1, 8);
      // print(stateActive[1].toString());

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Most active cases',
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                  child: BarChart(
                    stateData(stateActive),
                  ),
                ),
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

BarChartData stateData(List<StateActiveCases> stateActive) {
  return BarChartData(
    barGroups: [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            y: double.parse(stateActive[0].active.toString()),
            color: Colors.red,
          )
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            y: double.parse(stateActive[1].active.toString()),
            color: Colors.red,
          )
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            y: double.parse(stateActive[2].active.toString()),
            color: Colors.red,
          )
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            y: double.parse(stateActive[3].active.toString()),
            color: Colors.red,
          )
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            y: double.parse(stateActive[4].active.toString()),
            color: Colors.red,
          )
        ],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            y: double.parse(stateActive[5].active.toString()),
            color: Colors.red,
          )
        ],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            y: double.parse(stateActive[6].active.toString()),
            color: Colors.red,
          )
        ],
      ),
    ],
    alignment: BarChartAlignment.spaceAround,
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
          margin: 10.0,
          textStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          showTitles: true,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return stateActive[0].name;
              case 1:
                return stateActive[1].name;
              case 2:
                return stateActive[2].name;
              case 3:
                return stateActive[3].name;
              case 4:
                return stateActive[4].name;
              case 5:
                return stateActive[5].name;
              case 6:
                return stateActive[6].name;
              default:
                return '';
            }
          }),
      leftTitles: SideTitles(
        showTitles: true,
        margin: 5.0,
        textStyle: TextStyle(
          fontSize: 11.0,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        interval: 50000,
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    gridData: FlGridData(
      show: true,
      horizontalInterval: 50000,
      getDrawingHorizontalLine: (value) => FlLine(
        color: Colors.black.withOpacity(0.1),
        strokeWidth: 1.0,
      ),
    ),
    barTouchData: BarTouchData(
      enabled: true,
    ),
  );
}

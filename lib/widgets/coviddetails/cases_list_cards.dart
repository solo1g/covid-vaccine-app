import 'package:flutter/material.dart';

import '../../api/DailyCases.dart' as dailycases;
import '../../api/statewise_case.dart' as statewisedaily;

class CasesListCards extends StatefulWidget {
  @override
  _CasesListCardsState createState() => _CasesListCardsState();
}

class _CasesListCardsState extends State<CasesListCards> {
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
          var total = snapshot.data.statewise.first;
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildCasesCard(
                          'Total Cases', '${total.confirmed}', Colors.orange),
                      _buildCasesCard('Death', '${total.deaths}', Colors.red),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildCasesCard(
                          'Recovered', '${total.recovered}', Colors.green),
                      _buildCasesCard(
                          'Active', '${total.active}', Colors.lightBlue),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error occured");
        }
        return Text('Loading....');
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

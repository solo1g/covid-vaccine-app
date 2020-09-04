import 'package:expandable/expandable.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget susceptibilityPercent(String title, double percent) {
  return Theme(
    data: ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    child: ExpandablePanel(
      header: Row(
        children: [
          Expanded(
            flex: 2,
            child: CircularPercentIndicator(
              linearGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.red],
              ),
              radius: 150.0,
              lineWidth: 20.0,
              animation: true,
              percent: percent,
              center: Text(
                (percent * 100).toString(),
                style: new TextStyle(
                  fontSize: 25.0,
                ),
              ),
              footer: Text(
                title,
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              //progressColor: Colors.redAccent,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Icon(
                  FontAwesomeIcons.stethoscope,
                  color: Colors.blueGrey,
                  size: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "It seems you are at low risk!",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      expanded: Container(
        height: 150,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("Factor $index"),
                trailing: Text("$index %"),
              );
            }),
      ),
      tapHeaderToExpand: true,
      hasIcon: true,
    ),
  );
}

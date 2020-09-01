import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget susceptibilityPercent(String title, double percent) {
  return CircularPercentIndicator(
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
    progressColor: Colors.redAccent,
    backgroundColor: Colors.grey.shade300,
  );
}

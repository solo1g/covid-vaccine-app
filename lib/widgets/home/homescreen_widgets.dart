import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import '../../state_models/user_details_data.dart';

class SusceptibilityPercent extends StatelessWidget {
  final rand = new Random();
  final String title;
  final double percent;
  SusceptibilityPercent(this.title, this.percent);
  final factors = [
    "Diabetes",
    "Age",
    "Social Habits",
    "Frequent Contact",
    "Behavioral",
    "Other ailments",
    "Obesity",
    "Weak immunity",
    "Smoker/Drug user",
    "Daily interactions"
  ];

  @override
  Widget build(BuildContext context) {
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
                  (percent * 100).toStringAsFixed(2),
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
                    "It seems you are at ${percent < 0.5 ? "low" : "high"} risk!",
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(factors[rand.nextInt(factors.length)]),
                  trailing: Text(
                      (rand.nextDouble() * 37.0).toStringAsFixed(2) + " %"),
                );
              }),
        ),
        tapHeaderToExpand: true,
        hasIcon: true,
        // expanded: Container(
        //   height: 150,
        //   child: ListView.builder(
        //       itemCount:
        //           (context.watch<UserData>().userAnalysis["sorted"]).length,
        //       itemBuilder: (context, index) {
        //         return ListTile(
        //           leading: Text(context.watch<UserData>().userAnalysis["sorted"]
        //               [index][0]),
        //           trailing: Text(
        //             ((context.watch<UserData>().userAnalysis["sorted"][index]
        //                         [1])
        //                     .toStringAsFixed(2) +
        //                 " %"),
        //           ),
        //         );
        //       }),
        // ),
        // tapHeaderToExpand: true,
        // hasIcon: true,
      ),
    );
  }
}

class RankAndDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(60),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: RichText(
                      text: TextSpan(
                        text: 'Your order to get vaccine is ',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: "${context.watch<UserData>().rank}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                  width: 16,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 8),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'No',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red.shade400),
                          ),
                          TextSpan(
                            text: ' vaccine made till now.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:covidvaccineapp/ui/DailyCases.dart';
import 'package:covidvaccineapp/ui/HomeScreenWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Covid app"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      //TODO: Replace it with better drawer.
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.all(40),
        children: [
          Text(
              "This is temporary drawer to be replaced later, currently only to hold other pages, do not modify"),
          Text("Login screen"),
          Text("Register screen"),
        ],
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
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
                padding: const EdgeInsets.all(16.0),
                child: susceptibilityPercent("Susceptibility", 0.237),
              ),
            ),
          ),
          Padding(
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
                padding: const EdgeInsets.all(15.0),
                // TODO: modifu ui elements of DailyCases class
                child: DailyCases(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

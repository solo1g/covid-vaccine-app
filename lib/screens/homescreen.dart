// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidvaccineapp/screens/covid_details.dart';
import 'package:covidvaccineapp/state%20models/user_details_data.dart';
import 'package:covidvaccineapp/widgets/home/tips.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../widgets/home/home_cases.dart';
import '../widgets/home/homescreen_widgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

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
      body: RefreshIndicator(
        onRefresh: () async => await context.read<UserData>().updateData(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
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
                  child: susceptibilityPercent("Susceptibility", 0.2),
                ),
              ),
            ),
            Tips(),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(CovidDetailsPage.routeName),
              child: Padding(
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
                    // Todo: modify ui elements of DailyCases class
                    child: DailyCases(),
                  ),
                ),
              ),
            ),
            UserDataDisplay(),
          ],
        ),
      ),
    );
  }
}

class UserDataDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (context, user, child) {
        return Text(user.userData.toString());
      },
    );
  }
}

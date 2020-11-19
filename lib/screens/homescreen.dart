import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/home/home_cases.dart';
import '../widgets/home/homescreen_widgets.dart';
import './covid_details.dart';
import './google_map_screen.dart';
import '../state_models/user_details_data.dart';
import '../widgets/home/tips.dart';
import './something/dontopen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//Todo: some widgets are made here some in home screen widgets file. Move all there.
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Covify"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => await context.read<UserData>().updateData(),
        child: ListView(
          //Todo: remove individual padding and use padding of list view
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
                  child: SusceptibilityPercent(
                    "Susceptibility",
                    context.watch<UserData>().userAnalysis["riskFactorClamped"],
                  ),
                ),
              ),
            ),
            RankAndDays(),
            Tips(),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(CovidDetailsPage.routeName),
              onLongPress: () => Navigator.of(context)
                  .pushReplacementNamed(DontRead.routeName),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                        // Todo: modify ui elements of DailyCases class
                        child: DailyCases(),
                      ),
                      Divider(
                        indent: 20.0,
                        color: Theme.of(context).primaryColor,
                        thickness: 1.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 30.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Click for detailed data',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // UserDataDisplay(),
            Map(),
          ],
        ),
      ),
    );
  }
}

// class UserDataDisplay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserData>(
//       builder: (context, user, child) {
//         return Text(user.userData.toString());
//       },
//     );
//   }
// }

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Card(
            elevation: 5,
            child: GoogleMapScreen(),
          ),
        ),
        onTap: () => Navigator.pushNamed(context, GoogleMapScreen.routeName),
      ),
    );
  }
}

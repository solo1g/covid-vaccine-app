import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../state_models/user_details_data.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Profile'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Consumer<UserData>(
        builder: (context, user, child) {
          return ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 200.0,
                              height: 200.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: ExactAssetImage('Assets/user1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 129.0,
                            right: 143.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Theme.of(context).primaryColor,
                                radius: 36.0,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      user.userData.entries
                          .firstWhere((element) => element.key == "name")
                          .value,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Item(
                      'Gender :',
                      user.userData.entries
                          .firstWhere((element) => element.key == 'gender')
                          .value,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Item(
                      'Birthdate :',
                      DateFormat.yMMMd().format(user.userData.entries
                          .firstWhere((element) => element.key == 'birthdate')
                          .value
                          .toDate()),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Item(
                      'Weight :',
                      '${user.userData.entries.firstWhere((element) => element.key == 'weight').value} Kg',
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Item(
                      'Height :',
                      '${user.userData.entries.firstWhere((element) => element.key == 'height').value} cm',
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Item(
                      'Blood Type :',
                      user.userData.entries
                          .firstWhere((element) => element.key == 'blood')
                          .value,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Address :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(context.watch<UserData>().userPlacemark.toString()),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: <Widget>[
                          SubItem(
                            "Sublocality :",
                            context
                                .watch<UserData>()
                                .userPlacemark
                                .subLocality
                                .toString(),
                          ),
                          SubItem(
                            "District :",
                            context
                                .watch<UserData>()
                                .userPlacemark
                                .subAdministrativeArea
                                .toString(),
                          ),
                          SubItem(
                            "State :",
                            context
                                .watch<UserData>()
                                .userPlacemark
                                .administrativeArea
                                .toString(),
                          ),
                          SubItem(
                            "Country :",
                            context
                                .watch<UserData>()
                                .userPlacemark
                                .country
                                .toString(),
                          ),
                          SubItem(
                            "Postal Code :",
                            context
                                .watch<UserData>()
                                .userPlacemark
                                .postalCode
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'List of Health Conditions :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    // Text(
                    //   user.userData.entries
                    //       .firstWhere(
                    //           (element) => element.key == 'healthFactorList')
                    //       .value,
                    // ),
                    getHealthText(user.userData.entries
                        .firstWhere(
                            (element) => element.key == 'healthFactorList')
                        .value),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String head;
  final String body;

  Item(this.head, this.body);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          head,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          body,
          style: TextStyle(
            fontSize: 21,
          ),
        ),
      ],
    );
  }
}

class SubItem extends StatelessWidget {
  final String head;
  final String body;

  SubItem(this.head, this.body);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          head,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          body,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

Widget getHealthText(List<dynamic> strings) {
  List<Widget> list = new List<Widget>();
  if (strings?.isEmpty ?? true)
    list.add(Text('- No Serious Illness'));
  else
    for (var i = 0; i < strings.length; i++) {
      if (strings[i] == 'coivd19')
        list.add(Text('- Covid-19 Positive'));
      else if (strings[i] == 'covid19symptoms')
        list.add(Text('- Covid-19 symptoms (dry cough or fever)'));
      else if (strings[i] == 'covid19contact')
        list.add(Text('- Been in contact with someone with Covid-19'));
      else if (strings[i] == 'asthma')
        list.add(Text('- Asthma'));
      else if (strings[i] == 'kidney')
        list.add(Text('- Chronic kidney disease being treated with dialysis'));
      else if (strings[i] == 'liver')
        list.add(Text('- Chronic liver disease'));
      else if (strings[i] == 'immunesystem')
        list.add(Text('- Compromised immune system'));
      else if (strings[i] == 'heart')
        list.add(Text('- Serious heart condition'));
      else if (strings[i] == 'lungs')
        list.add(Text('- Chronic lung disease'));
      else if (strings[i] == 'diabetes')
        list.add(Text('- Diabetes'));
      else if (strings[i] == 'hiv')
        list.add(Text('- HIV positive'));
      else if (strings[i] == 'healthworker')
        list.add(Text('- Health worker'));
      else if (strings[i] == 'hypertension')
        list.add(Text('- Hypertension'));
      else if (strings[i] == 'other') list.add(Text('- Other chronic illness'));
    }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: list,
  );
}

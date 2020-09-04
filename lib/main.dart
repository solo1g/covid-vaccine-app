import 'package:flutter/material.dart';
// import 'SignIn.dart';
// import 'Home.dart';

import './screens/login_screen/SignInOne.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}

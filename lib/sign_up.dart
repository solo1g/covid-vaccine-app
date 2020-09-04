import 'package:flutter/material.dart';

// import 'login/SignInOne.dart';
import 'screens/login_screen/SignUpScreen.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpScreen(),
      //body: SignInTwo(),
    );
  }
}

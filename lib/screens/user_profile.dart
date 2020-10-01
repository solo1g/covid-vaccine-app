import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  static const routeName = '/user-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Peofile'),
      ),
      body: Center(
        child: Text('In progress'),
      ),
    );
  }
}

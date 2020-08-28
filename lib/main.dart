import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Covid Vaccine App"),
        ),
        body: Center(
          child: Text("Covid Vaccine App"),
        ),
      ),
    );
  }
}

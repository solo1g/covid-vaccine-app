import 'package:flutter/material.dart';

class Feedbackform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text("Please select the type of feedback"),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}

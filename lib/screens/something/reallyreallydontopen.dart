import 'package:flutter/material.dart';

class ButWhy extends StatefulWidget {
  final bool again;
  ButWhy(this.again);
  @override
  _ButWhyState createState() => _ButWhyState();
}

class _ButWhyState extends State<ButWhy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("But how?"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.again
            ? Text(
                "Here again? You really do have a lot of free time on your hand.",
                style: TextStyle(fontSize: 24),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Congratulations, on finding this. Really, I bet you read the code so here's something you deserve cheater.",
                    style: TextStyle(fontSize: 24),
                  ),
                  Image.asset(
                    'Assets/secret.gif',
                  ),
                ],
              ),
      ),
    );
  }
}

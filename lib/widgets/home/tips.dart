import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  final pages = [
    SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Card(
          color: Color(0xFF473F97),
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
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Don't forget to wear a mask!",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FaIcon(
                      FontAwesomeIcons.headSideMask,
                      color: Colors.deepOrangeAccent,
                      size: 72,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Card(
          color: Colors.red[400],
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
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Do regular temperature checks!",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FaIcon(
                      FontAwesomeIcons.thermometer,
                      color: Colors.orange[600],
                      size: 72,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Card(
          color: Colors.grey[100],
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
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "You can do this!",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FaIcon(
                      FontAwesomeIcons.virusSlash,
                      color: Colors.black,
                      size: 72,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Builder(
        builder: (context) => LiquidSwipe(
          enableSlideIcon: true,
          pages: pages,
        ),
      ),
    );
  }
}

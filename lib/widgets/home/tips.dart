import 'dart:async';
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
                      color: Colors.lightBlueAccent,
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
    SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Card(
          color: Color(0xff11e9b2),
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
                        "Wash hands with soap regularly",
                        style: TextStyle(
                          color: Color(0xff316fdf),
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FaIcon(
                      FontAwesomeIcons.handsWash,
                      color: Color(0xff316fdf),
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
                        "Follow social distancing",
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
                      FontAwesomeIcons.peopleArrows,
                      color: Colors.lightBlueAccent,
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
          color: Color(0xff8733a4),
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
                        "Refrain from shaking hands",
                        style: TextStyle(
                          color: Color(0xffd29de1),
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: FaIcon(
                      FontAwesomeIcons.handshakeSlash,
                      color: Color(0xffd29de1),
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
  int curPage = 0;
  bool reverse = false;
  LiquidController _liquidController;
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 7), changePage);
    _liquidController = LiquidController();
  }

  void changePage(timer) {
    setState(() {
      if (!reverse) {
        curPage++;
        if (curPage == pages.length) {
          reverse = true;
          curPage -= 2;
        }
      } else {
        curPage--;
        if (curPage == -1) {
          reverse = false;
          curPage += 2;
        }
      }
      _liquidController.animateToPage(page: curPage, duration: 600);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          LiquidSwipe(
            ignoreUserGestureWhileAnimating: true,
            liquidController: _liquidController,
            pages: pages,
            onPageChangeCallback: (page) {
              setState(() {
                curPage = page;
              });
            },
          ),
          Column(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      pages.length, (index) => _buildDot(index)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    double zoom = 1.0 + (index == curPage ? 1.0 : 0.0);
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.lightBlueAccent[200].withOpacity(0.5),
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }
}

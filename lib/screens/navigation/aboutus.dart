import 'dart:math';
import 'dart:ui';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:covidvaccineapp/screens/something/reallyreallydontopen.dart';
import 'package:flutter/material.dart';

import '../app_constants.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _tapCount = 0;
  bool _again = false;
  // final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    // assetsAudioPlayer.open(
    //   Audio("Assets/about_music.mp3"),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    // assetsAudioPlayer.stop();
    // assetsAudioPlayer.dispose();
  }

  void _unravel() {
    _tapCount++;
    if (_tapCount == 13) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => ButWhy(_again)))
          .then((value) {
        _tapCount = 0;
        _again = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff274a63),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About Us",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ClipRRect(
        child: Stack(
          children: [
            Transform.rotate(
              origin: Offset(500, 200),
              angle: -20 * pi / 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  gradient: LinearGradient(
                    colors: [
                      Constants.primaryColor,
                      Constants.blue1,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 200,
                width: double.infinity,
              ),
            ),
            Transform.rotate(
              origin: Offset(-550, -100),
              angle: -20 * pi / 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [
                      Constants.blue1,
                      Constants.purple1,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 300,
                width: double.infinity,
              ),
            ),
            Transform.rotate(
              angle: -20 * pi / 180,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    gradient: LinearGradient(
                      colors: [
                        Constants.purple1,
                        Constants.accentColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  height: 200,
                  width: 600,
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                GestureDetector(
                  onTap: () => _unravel(),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.black.withOpacity(0.5)),
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Image.asset(
                          'Assets/app_logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Behind this amazing app stands a genius team of developers.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withOpacity(0.8)),
                ),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('Assets/p1.gif'),
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shreyansh",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                '"Kya hi likhoon?"',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
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
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('Assets/p2.gif'),
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Saumay",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                '"Pro gamer"',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
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
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('Assets/p3.gif'),
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Saumya",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                '"Sbko mai app install krwaunga"',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
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
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('Assets/p4.gif'),
                          ),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Satya",
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                '"Yeh app best hai. Ab paisa hi paisa."',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

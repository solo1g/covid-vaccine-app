import 'package:covidvaccineapp/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import '../navigation.dart';

class DontRead extends StatefulWidget {
  static const routeName = '/dontread';
  DontRead({Key key}) : super(key: key);
  @override
  _DontReadState createState() => _DontReadState();
}

class _DontReadState extends State<DontRead>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _rotateAnimation;
  final assetsAudioPlayer = AssetsAudioPlayer();
  // AudioCache _audioCache = AudioCache();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
    );
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(2.7, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
    _rotateAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
    assetsAudioPlayer.open(
      Audio("Assets/audio2.mp3"),
      volume: 0.5,
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("Assets/space.jpg"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: RotationTransition(
                    turns: _rotateAnimation,
                    child: Image(
                      image: AssetImage('Assets/covid.png'),
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: TyperAnimatedTextKit(
                  speed: Duration(milliseconds: 175),
                  // totalRepeatCount: 1,
                  isRepeatingAnimation: false,
                  text: ['Covid-19 was an Impostor'],
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width - 60,
                ),
                child: FloatingActionButton(
                  child: Icon(
                    Icons.arrow_back,
                    size: 50,
                  ),
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed(NavigationHomeScreen.routeName),
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

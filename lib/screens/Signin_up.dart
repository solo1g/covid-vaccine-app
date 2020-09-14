import 'package:flutter/material.dart';

import '../screens/navigation.dart';

enum Mode { Signup, Login }

class SignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/image1.jpg'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 270),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Sign(),
          ),
        ],
      ),
    );
  }
}

class Sign extends StatefulWidget {
  const Sign({
    Key key,
  }) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> with SingleTickerProviderStateMixin {
  Mode _mode = Mode.Login;
  final _passwordFocusNode = FocusNode();
  AnimationController _controller;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  void _switchMode() {
    if (_mode == Mode.Login) {
      setState(() {
        _mode = Mode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _mode = Mode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelStyle: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  constraints: BoxConstraints(
                    minHeight: _mode == Mode.Signup ? 60 : 0,
                    maxHeight: _mode == Mode.Signup ? 120 : 0,
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  child: FadeTransition(
                    opacity: _opacity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextFormField(
                        enabled: _mode == Mode.Signup,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SFUIDisplay',
                        ),
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Email-Id',
                          focusColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFUIDisplay',
                      ),
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        focusColor: Colors.black,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelStyle: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  constraints: BoxConstraints(
                    minHeight: _mode == Mode.Signup ? 60 : 0,
                    maxHeight: _mode == Mode.Signup ? 120 : 0,
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  child: FadeTransition(
                    opacity: _opacity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: TextFormField(
                        enabled: _mode == Mode.Signup,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SFUIDisplay',
                        ),
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          focusColor: Colors.black,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () => {
                      Navigator.of(context)
                          .pushReplacementNamed(NavigationHomeScreen.routeName),
                    },
                    child: Text(
                      _mode == Mode.Login ? 'SIGN IN' : 'SIGN UP',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color.fromRGBO(205, 127, 80, 10),
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _mode == Mode.Login
                          ? "Don’t have an Account ? "
                          : "Already have an Account ? ",
                      style: TextStyle(color: Color.fromRGBO(205, 127, 80, 10)),
                    ),
                    GestureDetector(
                      onTap: _switchMode,
                      child: Text(
                        _mode == Mode.Signup ? "Sign Up" : "Sign In",
                        style: TextStyle(
                          color: Color.fromRGBO(205, 127, 80, 10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

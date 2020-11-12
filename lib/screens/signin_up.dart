import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'navigation.dart';
import 'user_registration_details.dart';
import '../state_models/user_details_data.dart';

enum Mode { Signup, Login }

class Sign extends StatefulWidget {
  static const routeName = '/signscreen';
  const Sign({
    Key key,
  }) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> with SingleTickerProviderStateMixin {
  bool showSpinner;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String _email, _password;
  Mode _mode = Mode.Login;
  final _passwordFocusNode = FocusNode();
  final _confirmpasswordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  AnimationController _controller;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    showSpinner = false;
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
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/image2.jpg'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 270),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(23),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // AnimatedContainer(
                          //   constraints: BoxConstraints(
                          //     minHeight: _mode == Mode.Signup ? 60 : 0,
                          //     maxHeight: _mode == Mode.Signup ? 120 : 0,
                          //   ),
                          //   duration: Duration(milliseconds: 300),
                          //   curve: Curves.easeIn,
                          //   child: FadeTransition(
                          //     opacity: _opacity,
                          //     child: Padding(
                          //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          //       child: TextFormField(
                          //         textInputAction: TextInputAction.next,
                          //         onFieldSubmitted: (_) {
                          //           _mode == Mode.Login
                          //               ? FocusScope.of(context)
                          //                   .requestFocus(_passwordFocusNode)
                          //               : FocusScope.of(context)
                          //                   .requestFocus(_emailFocusNode);
                          //         },
                          //         enabled: _mode == Mode.Signup,
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontFamily: 'SFUIDisplay',
                          //         ),
                          //         decoration: InputDecoration(
                          //           labelText: 'Username',
                          //           focusColor: Colors.black,
                          //           prefixIcon: Icon(
                          //             Icons.person,
                          //             color: Colors.black,
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(color: Colors.black),
                          //           ),
                          //           labelStyle: TextStyle(fontSize: 15),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Container(
                              color: Colors.white,
                              child: TextFormField(
                                validator: (txt) {
                                  if (txt.isEmpty ||
                                      txt == null ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(txt))
                                    return "Enter a valid email address";
                                  return null;
                                },
                                onChanged: (txt) => _email = txt,
                                focusNode: _emailFocusNode,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFUIDisplay'),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(_passwordFocusNode);
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email-id',
                                  prefixIcon: Icon(
                                    Icons.email,
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            child: Container(
                              color: Colors.white,
                              child: TextFormField(
                                validator: FormBuilderValidators.minLength(6),
                                onChanged: (txt) => _password = txt,
                                textInputAction: _mode == Mode.Signup
                                    ? TextInputAction.next
                                    : TextInputAction.done,
                                onFieldSubmitted: (_) {
                                  _mode == Mode.Signup
                                      ? FocusScope.of(context).requestFocus(
                                          _confirmpasswordFocusNode)
                                      : null;
                                },
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
                                  validator: (txt) {
                                    if (_mode == Mode.Signup &&
                                        txt != _password)
                                      return "Passwords don't match";
                                    return null;
                                  },
                                  enabled: _mode == Mode.Signup,
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFUIDisplay',
                                  ),
                                  focusNode: _confirmpasswordFocusNode,
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                    focusColor: Colors.black,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _email = _email.trim();
                                  if (_mode == Mode.Login) {
                                    try {
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                              email: _email,
                                              password: _password);
                                      if (user != null) {
                                        //todo: temporary fix.
                                        context.read<UserData>().updateData();
                                        _firestore
                                            .collection("UserDetails")
                                            .doc(_auth.currentUser.email)
                                            .get()
                                            .then((doc) {
                                          if (doc.exists) {
                                            setState(() {
                                              showSpinner = false;
                                            });
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    NavigationHomeScreen
                                                        .routeName);
                                          } else {
                                            Navigator.pushReplacementNamed(
                                                context,
                                                UserDetailsStepper.routeName);
                                          }
                                        });
                                      }
                                    } catch (e) {
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      print(e);
                                    }
                                  } else {
                                    try {
                                      setState(() {
                                        showSpinner = true;
                                      });
                                      final newUser = await _auth
                                          .createUserWithEmailAndPassword(
                                              email: _email,
                                              password: _password);
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      if (newUser != null) {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                UserDetailsStepper.routeName);
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                }
                              },
                              child: Text(
                                _mode == Mode.Login ? 'SIGN IN' : 'SIGN UP',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // color: Color.fromRGBO(205, 127, 80, 10),
                              color: Theme.of(context).accentColor,
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
                                style: TextStyle(
                                  // color: Color.fromRGBO(205, 127, 80, 10),
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: _switchMode,
                                child: Text(
                                  _mode == Mode.Signup ? "Sign In" : "Sign Up",
                                  style: TextStyle(
                                    // color: Color.fromRGBO(205, 127, 80, 10),
                                    color: Theme.of(context).accentColor,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

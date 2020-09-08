import 'package:flutter/material.dart';

import '../../Home.dart';
import '../../sign_up.dart';
import 'SignUpScreen.dart';
//import '../../Widgets/login/already_have_a_account_check.dart';

class SignInOne extends StatelessWidget {
  final _passwordFocusNode = FocusNode();

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
                    alignment: Alignment.topCenter)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 270),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                          //color: Color(0xfff5f5f5),
                          color: Colors.white,
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'SFUIDisplay'),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            decoration: InputDecoration(
                                //border: OutlineInputBorder(),
                                labelText: 'Username',
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                //fillColor: Colors.white70,
                                labelStyle: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                      Container(
                        //color: Color(0xfff5f5f5),
                        color: Colors.white,
                        child: TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          focusNode: _passwordFocusNode,
                          decoration: InputDecoration(
                              //border: OutlineInputBorder(),
                              labelText: 'Password',
                              focusColor: Colors.black,
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              //prefixIconConstraints: Icons.format_bold,
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            ),
                          },
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SFUIDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //color: Color(0xffff2d55),rgb(205,133,63)rgb(255,127,80)
                          color: Color.fromRGBO(205, 127, 80, 10),
                          elevation: 0,
                          minWidth: 400,
                          height: 50,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
//                      AlreadyHaveAnAccountCheck(
//                        press: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => SignUp()),
//                          );
//                        },
//                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

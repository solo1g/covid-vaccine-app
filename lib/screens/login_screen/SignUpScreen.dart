import 'package:flutter/material.dart';
// import '../../Home.dart';
// import '../../SignIn.dart';
// import 'SignInOne.dart';
import '../../widgets/login/already_have_a_account_check.dart';
import '../login_screen/SignInOne.dart';

class SignUpScreen extends StatelessWidget {
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          margin: EdgeInsets.only(top: 270),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(23),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      //color: Color(0xfff5f5f5),
                      color: Colors.white,
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.person, color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            //fillColor: Colors.white70,
                            labelStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    /*Padding(
                      padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                      child: Container(
                        //color: Color(0xfff5f5f5),
                        color: Colors.white,
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SFUIDisplay'
                          ),
                          decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person, color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black
                                  )
                              ),
                              //fillColor: Colors.white70,
                              labelStyle: TextStyle(
                                  fontSize: 15
                              )
                          ),
                        ),
                      ),
                    ),*/
                    Container(
                      //color: Color(0xfff5f5f5),
                      color: Colors.white,
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                            labelText: 'email-id',
                            focusColor: Colors.black,
                            prefixIcon: Icon(Icons.mail, color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            //prefixIconConstraints: Icons.format_bold,
                            labelStyle: TextStyle(fontSize: 15)),
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
                        onPressed: () {}, //since this is only a UI app
                        child: Text(
                          'SIGN UP',
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
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignInOne();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

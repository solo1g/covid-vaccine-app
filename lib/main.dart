import 'package:covidvaccineapp/screens/UserDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/Signin_up.dart';
import './screens/navigation.dart';
import './screens/HomeScreen.dart';
import './screens/covid_details.dart';
import './screens/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF473F97),
        accentColor: Color(0xFFa37eba),
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      //initialRoute: UserDetailsStepper.routeName,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? Sign.routeName
          : NavigationHomeScreen.routeName,
      // : CovidDetails.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        NavigationHomeScreen.routeName: (ctx) => NavigationHomeScreen(),
        UserDetailsStepper.routeName: (ctx) => UserDetailsStepper(),
<<<<<<< HEAD
        SignScreen.routeName: (ctx) => SignScreen(),
        CovidDetails.routeName: (ctx) => CovidDetails(),
        UserProfile.routeName: (ctx) => UserProfile(),
=======
        Sign.routeName: (ctx) => Sign(),
>>>>>>> 8ad31c42c2959314b866b985704ea610c8a5762f
      },
    );
  }
}

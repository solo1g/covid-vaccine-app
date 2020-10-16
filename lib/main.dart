import 'package:covidvaccineapp/screens/user_registration_details.dart';
import 'package:covidvaccineapp/screens/splash_screen.dart';
import 'package:covidvaccineapp/state%20models/covid_details_data.dart';
import 'package:covidvaccineapp/state%20models/user_details_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/signin_up.dart';
import './screens/navigation.dart';
import 'screens/homescreen.dart';
import './screens/covid_details.dart';
import 'screens/navigation/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CovidData(),
          ),
          ChangeNotifierProvider(
            create: (_) => UserData(),
          ),
        ],
        child: App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
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
      initialRoute: SplashScreenController.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        NavigationHomeScreen.routeName: (ctx) => NavigationHomeScreen(),
        UserDetailsStepper.routeName: (ctx) => UserDetailsStepper(),
        Sign.routeName: (ctx) => Sign(),
        CovidDetailsPage.routeName: (ctx) => CovidDetailsPage(),
        UserProfile.routeName: (ctx) => UserProfile(),
        SplashScreenController.routeName: (ctx) => SplashScreenController(),
      },
    );
  }
}

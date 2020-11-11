import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wiredash/wiredash.dart';

import './screens/signin_up.dart';
import './screens/navigation.dart';
import './screens/homescreen.dart';
import './screens/covid_details.dart';
import './screens/navigation/user_profile.dart';
import './screens/google_map_screen.dart';
import './screens/user_registration_details.dart';
import './screens/splash_screen.dart';
import './state_models/covid_details_data.dart';
import './state_models/user_details_data.dart';
import './screens/something/dontopen.dart';

//Todo: manage api keys better
final apiKey = "AIzaSyCPb-HX4wCgJ5EBZGpqPWLFjkffkbBhvo4";
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
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return Wiredash(
      projectId: 'covid_vaccine_app-0qt45po',
      secret: 'gtzsqnk352hq2exoh1e1cgz0wxa1u13p',
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
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
          GoogleMapScreen.routeName: (ctx) => GoogleMapScreen(),
          DontRead.routeName: (ctx) => DontRead(),
        },
      ),
    );
  }
}

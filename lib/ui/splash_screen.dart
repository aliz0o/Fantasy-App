import 'package:fantasy/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class TheSplashScreen extends StatefulWidget {
  @override
  _TheSplashScreenState createState() => _TheSplashScreenState();
}

class _TheSplashScreenState extends State<TheSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SplashScreen(
          useLoader: true,
          seconds: 3,
          navigateAfterSeconds: HomeScreen(),
          title: new Text(
            'Fantasy',
            style: new TextStyle(
              fontSize: 30.0,
            ),
          ),
          image: new Image.asset('images/splash.gif'),
          loadingText: Text(
            'The strength of the team is each individual member\nThe strength of each member is the team',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.5,
            ),
          ),
          photoSize: 200.0,
          loaderColor: Colors.red),
    );
  }
}

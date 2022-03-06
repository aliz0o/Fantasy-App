import 'package:fantasy/ui/home_screen.dart';
import 'package:fantasy/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TheSplashScreen extends StatefulWidget {
  @override
  _TheSplashScreenState createState() => _TheSplashScreenState();
}

class _TheSplashScreenState extends State<TheSplashScreen> {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: SplashScreen(
          useLoader: true,
          seconds: 3,
          navigateAfterSeconds: user == null ? LoginScreen() : HomeScreen(),
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

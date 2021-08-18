import 'package:fantasy/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Aclonica',
        appBarTheme: AppBarTheme(
          color: Color(0xff12005e),
        ),
      ),
      home: TheSplashScreen(),
    );
  }
}

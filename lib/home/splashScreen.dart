import 'package:filladmin/home/dashboard.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => new _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new Dashboard(),
      title: new Text(
        'Admin App - fill',
        style: new TextStyle(
            fontSize: 45, color: Colors.white, fontFamily: 'RobotoMono'), textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      onClick: () => new Dashboard(),
      loaderColor: Colors.black,
      loadingText: new Text(
        'Built by Makena',
        style: new TextStyle(
            fontSize: 23, color: Colors.white, fontFamily: 'RobotoMono'),
      ),
    );
  }
}
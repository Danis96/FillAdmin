import 'package:filladmin/home/splashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fill Admin',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MySplashScreen(),
      ),
    );
  }
}

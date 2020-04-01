import 'package:filladmin/fetchTransfers.dart';
import 'package:filladmin/firebaseMethods.dart/getTransfers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fill Admin',
      theme: ThemeData.dark(),
      home: dashboard(),
    );
  }
}

Widget dashboard() {
  return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Transfers')),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('OTVORIO SAM PLAIKACIJUUU'),
            FetchTransfers()
          ],
        ),
      ));
}

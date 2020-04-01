import 'package:filladmin/pendingTransfers/pendingTransfers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fill Admin',
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Transfers')),
        ),
        body: Center(
          child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PendingTransfersHome())),
              child: Text('Hello world')),
        ));
  }
}

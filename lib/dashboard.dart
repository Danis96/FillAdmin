import 'package:filladmin/doneTransfers/doneTransfers.dart';
import 'package:filladmin/fetchTransfers.dart';
import 'package:filladmin/pendingTransfers/pendingTransfers.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('Transfers')),
          bottom: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: 'Pending Transfers'),
                Tab(
                  text: 'Done Transfers',
                ),
              ])),
      body: TabBarView(
        children: [
          PendingTransfersHome(),
          DoneTransfers(),
        ],
        controller: _tabController,
      ),
    );
  }
}

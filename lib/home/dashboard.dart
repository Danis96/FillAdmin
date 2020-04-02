import 'package:filladmin/doneTransfers/doneTransfers.dart';
import 'package:filladmin/export/exportView.dart';
import 'package:filladmin/export/sendEmail.dart';
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
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('Transfers')),
          centerTitle: true,
          bottom: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: 'Pending'),
                Tab(
                  text: 'Done',
                ),
                 Tab(
                  text: 'Export',
                ),
              ])),
      body: TabBarView(
        children: [
          PendingTransfersHome(),
          DoneTransfers(),
           ExportView(),
        ],
        controller: _tabController,
      ),
    );
  }
}

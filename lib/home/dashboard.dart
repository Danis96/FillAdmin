import 'package:filladmin/components/text.dart';
import 'package:filladmin/doneTransfers/doneTransfers.dart';
import 'package:filladmin/export/exportView.dart';
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
          title: Center(child: Text(CustomText().subject)),
          centerTitle: true,
          bottom: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: CustomText().pending),
                Tab(
                  text: CustomText().done,
                ),
                 Tab(
                  text: CustomText().export,
                ),
              ])),
      body: TabBarView(
        children: [
          PendingTransfersHome(refreshDash),
          DoneTransfers(),
           ExportView(),
        ],
        controller: _tabController,
      ),
    );
  }
  refreshDash() {
    setState(() {});
  }
}



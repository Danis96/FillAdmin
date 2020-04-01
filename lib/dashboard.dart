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
                Tab(
                    icon: new Icon(Icons.check_box_outline_blank),
                    text: 'Pending Transfers'),
                Tab(
                  icon: new Icon(Icons.check_box),
                  text: 'Done Transfers',
                ),
              ])),
      body: TabBarView(
        children: [
          new Text("This Pending Transfers View"),
          new Text("This Done Transfers View"),
        ],
        controller: _tabController,
      ),
    );
  }
}
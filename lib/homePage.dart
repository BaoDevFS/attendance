import 'package:attendance/tab/homeTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'attendance_icons.dart';

class HomePage extends StatefulWidget {
// list class var

  @override
  State<StatefulWidget> createState() {
    // fetchgroup

    return new _HomePageState();
  }
}

@override
void initState() {
  
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              new Container(
                color: Colors.yellow,
              ),
              HomeTab(),
              new Container(
                color: Colors.lightGreen,
              ),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Attendance.chart_line),
              ),
              Tab(
                icon: Icon(Attendance.home),
              ),
              Tab(
                icon: Icon(Attendance.person_outline),
              )
            ],
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.black26,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

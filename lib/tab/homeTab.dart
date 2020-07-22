import 'package:attendance/attendance_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 103,
                    height: 78,
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/logo@3x.png'),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      "Hello, Tanh",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 16),
                    child: Text(
                      "Your current class:",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: <Widget>[
                  rowInListView(),
                  rowInListView(),
                  rowInListView()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget rowInListView() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 10, top: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/img_backtoschool@3x.jpg')),
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black26))),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "CNPM_T4_789",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lab",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nguyen Duc Cong Song",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 10, top: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Next lesson:",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "12:15 - 16/7/2020",
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          height: 18,
          width: 18,
          child: Icon(
            Attendance.add_alerts,
            size: 26,
            color: Color(0xffff6400),
          ),
        ),
        Positioned(
          right: 10,
          top: 60,
          width: 70,
          height: 70,
          child: CircleAvatar(
            backgroundImage: AssetImage('images/avatar@3x.png'),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

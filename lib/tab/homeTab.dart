import 'dart:convert';
import 'dart:io';

import 'package:attendance/attendance_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeTabState();
  }
}

class Group {
  final String name;
  final String description;
  final String room;
  final int isOpen;

  Group({this.name, this.description, this.room, this.isOpen});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      name: json['name'],
      description: json['description'],
      room: json['room'],
      isOpen: json['is_open'],
    );
  }
}

class _HomeTabState extends State<HomeTab> {
  List classes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClasses();
  }

  fetchClasses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token') ?? "";

    final response = await http.get(
      'http://127.0.0.1:8000/api/auth/getlistclass',
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    print(response);
    if (response.statusCode == 200) {
      List loadedClasses = json.decode(response.body);
      var listTmp = [];
      for (var i in loadedClasses) {
        listTmp.add(Group.fromJson(i));
      }
      setState(() {
        isLoading = false;
        classes = listTmp;
      });
      print("Fetch API coplete!!!");
    } else {
      throw Exception('Failed to load API');
    }
  }

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
                    margin: EdgeInsets.only(top: 35),
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
                      "Hello",
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
            child: isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: new ListView.builder(
                        itemCount: classes.length, itemBuilder: _rowInListView)

                    // ListView(
                    //   children: <Widget>[
                    //     rowInListView(),
                    //     rowInListView(),
                    //     rowInListView()
                    //   ],
                    // ),
                    ),
          )
        ],
      ),
    );
  }

  Widget _rowInListView(BuildContext context, int index) {
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
                padding: EdgeInsets.only(bottom: 10, left: 10, top: 15),
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
                        classes[index].name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description: " + classes[index].description,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Mr. Black",
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
                        "Room",
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        classes[index].room,
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        if (classes[index].isOpen == 1)
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
          top: 70,
          width: 70,
          height: 70,
          child: CircleAvatar(
            backgroundImage: AssetImage('images/mrblack.jpg'),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

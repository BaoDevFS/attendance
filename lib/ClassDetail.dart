import 'package:attendance/Model/Class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cameraScreen.dart';

class CLassDetail extends StatelessWidget {
  final Class myClass;
  CLassDetail(this.myClass);

  @override
  Widget build(BuildContext context) {
    return Material(
      // Column is a vertical, linear layout.
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
          Expanded(
            child: Center(
              child: buttonAttend(context, myClass.id),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonAttend(BuildContext context, int classID) {
    return InkWell(
      onTap: () async {
        if (myClass.isOpen == 1)
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CameraScreen(
              groupid:classID
                ),
          ));
      },
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (myClass.isOpen == 1)
              Center(
                child: Text(
                  "ATTENDANCE NOW",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              )
            else
              Center(
                child: Text(
                  "NO ATTENDANCE REQUIREMENT",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

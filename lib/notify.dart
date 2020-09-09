import 'package:attendance/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
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
            child: Column(
              children: [
                Text(
                  "Your attendane has been seve in server. Please wait to check the result after a while!",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                Center(
                  child: buttonAttend(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonAttend(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            "OK! I GOT IT",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

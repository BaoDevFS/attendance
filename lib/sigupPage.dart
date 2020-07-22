import 'package:attendance/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  var checkbox = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[top(), center(width, height), bottom()],
          ),
        ),
      ),
    );
  }

  Widget top() {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Sign Up",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.purple,
                          blurRadius: 20.0,
                        )
                      ]),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Positioned(
                        right: -50,
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(right: 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.purple,
                                  blurRadius: 20.0,
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget center(double width, double height) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              width: width,
              height: height * 35 / 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black54, blurRadius: 10)
                  ]),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "UserName",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.purple,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.purple),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Repassword",
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.purple),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.purple,
                        value: checkbox,
                        onChanged: (v) {
                          setState(() {
                            checkbox = !checkbox;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                            text: "By signing up I agree with ",
                            style: TextStyle(color: Colors.black54),
                            children: [
                              TextSpan(
                                  text: "terms and condition",
                                  style: TextStyle(color: Colors.purple))
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: buttonLogin(width, height * 30 / 100),
            )
          ],
        ),
      ),
    );
  }

//  buttonLogin(width, height * 35 / 100),
  Widget buttonLogin(double width, double height) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: width * 35 / 100,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.purple,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height * 50 / 100),
                bottomLeft: Radius.circular(height * 50 / 100))),
        child: Center(
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget bottom() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
      },
      child: Container(
        padding: EdgeInsets.only(right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          left: -50,
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(right: 0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple,
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.purple,
                                    blurRadius: 20.0,
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(right: 0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.purple,
                            blurRadius: 20.0,
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

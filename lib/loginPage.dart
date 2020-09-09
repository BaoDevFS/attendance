import 'package:attendance/controler/loginControler.dart';
import 'package:attendance/homePage.dart';
import 'package:attendance/sigupPage.dart';
import 'package:attendance/uploadFace.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var checkbox = false;
  LoginControler _loginControler;
  TextEditingController _emailText, _passwordText;
  var email;

  @override
  void initState() {
    super.initState();
    _loginControler = new LoginControler();
    _emailText = new TextEditingController();
    _passwordText = new TextEditingController();
  }

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
            "Login",
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
              height: height * 30 / 100,
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
                      controller: _emailText,
                      validator: (value) {
                        // kiểm tra rỗng
                        if (value.isEmpty) {
                          return 'Nhập email';
                        } else if (value != email) {
                          return "Email hoặc mật khẩu không đúng";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Email",
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
                      controller: _passwordText,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Nhập password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
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
              margin: EdgeInsets.only(top: 10, left: 30),
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
                      Text("Remember me"),
                    ],
                  ),
                  buttonLogin(width, height * 35 / 100),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonLogin(double width, double height) {
    return InkWell(
      onTap: () async {
        email = _emailText.text;
        if (_formKey.currentState.validate()) {
          final respone =
              await _loginControler.login(email, _passwordText.text);
          print(respone);
          if (respone[0] == true) {
            if (respone[1] == null || respone[1] == 0) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => GetFaceToTrain(),
              ));
            } else
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
          } else {
            email = " ";
            _formKey.currentState.validate();
          }
        }
      },
      child: Container(
        width: width * 35 / 100,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.purple,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height * 50 / 100),
                bottomLeft: Radius.circular(height * 50 / 100))),
        child: Center(
          child: Text(
            "LOGIN",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

//  Route _createRoute() {
//    return PageRouteBuilder(
//      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
//      transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        var begin = Offset(0.0, 1.0);
//        var end = Offset.zero;
//        var curve = Curves.ease;
//
//        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//        return SlideTransition(
//          position: animation.drive(tween),
//          child: child,
//        );
//      },
//    );
//  }
  Widget bottom() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SignUpPage(),
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
              "Sign Up",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailText.dispose();
    _passwordText.dispose();
  }
}

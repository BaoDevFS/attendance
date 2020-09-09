import 'package:attendance/homePage.dart';
import 'package:attendance/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMain(),
    );
  }
}
class MyMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyMain();
  }

}
class _MyMain extends State<MyMain>{
  @override
  void initState() {
    checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
  checkLogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token');
    if (token == null || token.isEmpty) {
      Navigator.of(context) .pushReplacement(
          new MaterialPageRoute(builder: (context) => LoginPage()));
    }else{
      Navigator.of(context) .pushReplacement(
          new MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}

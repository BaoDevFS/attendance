import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginControler {
  var accessToken;
  var isTrained;
  login(BuildContext context, String email, String password) async {
    print(email + ":" + password);
    var uri = Uri.http('192.168.1.21:8000', '/api/auth/login',
        {'email': email, 'password': password});
    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest'
      },
    );
    if (response.statusCode == 200) {
      var token = jsonDecode(response.body.toString());
      if (token['mesage'] != "Unauthorized") {
        accessToken = token['access_token'];
        isTrained = token['is_trained'];
        print(accessToken);
        // save jwt to shared_preferences instance
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', accessToken);
        if (isTrained == null || isTrained == 1) {
          // if dont have data on sever, navigate to upload face data page.
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UploadFace(),
          ));
        }
        return true;
      } else {
        print("false");
        return false;
      }
    }
  }
}

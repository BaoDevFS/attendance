import 'dart:convert';

import 'package:attendance/definehost.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginControler {
  var accessToken;
  var isTrained;
  login(String email, String password) async {
    print(email + ":" + password);
    var uri = Uri.http(host, apiLogin,
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
        // save jwt to shared_preferences instance
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', accessToken);
        return [true, isTrained];
      } else {
        print("false");
        return [false];
      }
    }
  }
}

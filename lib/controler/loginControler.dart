import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginControler {
  var accessToken;
  login(String email, String password) async {
    print(email+":"+password);
    var uri = Uri.http('192.168.137.1', '/Attendance_laravel/public/api/auth/login',{'email': email, 'password': password});
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json',
        'X-Requested-With':'XMLHttpRequest'},);
    if(response.statusCode==200){
      var token=jsonDecode(response.body.toString());
      print(token);
      if(token['mesage']!="Unauthorized"){
        accessToken = token['access_token'];
        print("true");
        return true;
      }else{
        return false;
      }
    }

  }
}

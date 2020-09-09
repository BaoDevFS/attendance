import 'dart:convert';
import 'dart:io';

import 'package:attendance/definehost.dart';
import 'package:attendance/notify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AttendanceController {
  String token;

  attendace(String path, int groupid, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token');
    if (token == null || token.isEmpty) {}
    http.MultipartFile multipartFile;
    http.MultipartRequest multipartRequest;
    var uri = Uri.http(
      host,
      apiAttendace,
    );
    multipartFile = await http.MultipartFile.fromPath("avatar", path);
    multipartRequest = http.MultipartRequest("POST", uri);
    multipartRequest.files.add(multipartFile);
    multipartRequest.fields.addAll({'groupid': '$groupid'});
    multipartRequest.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'authorization': 'Bearer $token'
    });
    http.StreamedResponse response = await multipartRequest.send();
    response.stream.transform(utf8.decoder).listen((value) {
      var json = jsonDecode(value);
      print(json);
      if (json['status'] == 'processing') {
        print("attend ok");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Notify()));
      } else {
        print("attend failse");
      }
    });
  }
}

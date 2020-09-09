import 'dart:convert';
import 'dart:io';

import 'package:attendance/definehost.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadImageControler {
  String token;

  Future<int> upload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = await prefs.getString('token');
    if (token == null || token.isEmpty) {}
    var folders = await getExternalStorageDirectory();
    http.MultipartFile multipartFile;
    http.MultipartRequest multipartRequest;
    int succes = 0;
    for (var file in folders.listSync()) {
      var uri = Uri.http(
        host,
        apiUploadImgToTrain,
      );
      if (file is File) {
        multipartFile = await http.MultipartFile.fromPath("image", file.path);
        multipartRequest = http.MultipartRequest("POST", uri);
        multipartRequest.files.add(multipartFile);
        multipartRequest.headers.addAll({
          'Content-Type': 'multipart/form-data',
          'authorization': 'Bearer $token'
        });
        http.StreamedResponse response = await multipartRequest.send();
        response.stream.transform(utf8.decoder).listen((value) {
          var json = jsonDecode(value);
          print(json);
          if (json['status'] == 'true') {
            succes++;
          }
        });
      }
    }
    if (succes >= 8) {
      alreadyTrain();
      return 1;
    } else {
      return -1;
    }
  }

  Future<int> addFace() async {
    var uri = Uri.http(
      host,
      apiAddFace,
    );
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      return 1;
    } else {
      return -1;
    }
  }

  Future<int> alreadyTrain() async {
    var uri = Uri.http(
      host,
      apiAlreadyTrain,
    );
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      addFace();
      return 1;
    } else {
      return -1;
    }
  }

}

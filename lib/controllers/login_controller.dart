import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

login(String email, String password) async {
  const String baseUrl = 'http://10.0.2.2:8000/api/login';

  var client = http.Client();

  var url = Uri.parse(baseUrl);

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
  };
  var body = json.encode({
    'email': email,
    'password': password,
  });
  var response = await client.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    var message = json.decode(response.body);

    // debugPrint(
    //     message['accessToken']); // if (message['code'].toString() == "200") {
    saveToken(message['accessToken']);

    ///MENSAJE BIEN BONITO
    return 200;
    // }
  } else {
    return 300;
  }
}

saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token_app', token);
}

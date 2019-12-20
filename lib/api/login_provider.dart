import 'dart:convert';

import 'package:http/http.dart';

class LoginProvider {
  final String _server = "http://172.20.2.133:3000/";

  final Client _client;

  LoginProvider() : _client = Client();

  Future<bool> login({String userName, String password}) async {
    Map<String, String> body = {
      'username': userName,
      'password': password,
    };

    Response response = await _client.post(_server + 'login', body: body);
    Map<String, dynamic> data = json.decode(response.body);
    return data['success'];
  }
}

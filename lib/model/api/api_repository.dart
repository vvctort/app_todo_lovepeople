import 'dart:convert';

import 'package:app_todo_lovepeople/model/login_json.dart';
import 'package:app_todo_lovepeople/view/tela_login.dart';
import 'package:http/http.dart' as http;

class ApiTodo{
  String token = '';

  
  Future<LoginPageJson?> login(String email, String senha) async {
    var url = Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local');
    var response = await http.post(
      url,
      body: {
        'identifier': email,
        'password': senha,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      LoginPageJson resp = LoginPageJson.fromJson(json);
      token = resp.jwt!;
      return resp;
    }
  }}
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future postUser() async {
    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local');
    var response = await http.post(
      url,
      body: {"identifier": "meu@email.com", "password": 123456},
    );
    print('$response');
  }
}

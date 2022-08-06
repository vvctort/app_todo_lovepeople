import 'dart:convert';

import 'package:app_todo_lovepeople/model/api/json_repository.dart';
import 'package:http/http.dart' as http;

class ApiTodo {
  String token = '';

  Future<CadastroUsuariojson?> cadastro(
      String email, String nome, String senha) async {
    var url =
        Uri.parse('https://todo-lovepeople.herokuapp.com/auth/local/register');
    var response = await http.post(url, body: {
      'username': nome,
      'e-mail': email,
      'senha': senha,
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      LoginDeUsuario resp = LoginDeUsuario.fromJson(json);
      var token = resp.jwt!;
    }
  }
}

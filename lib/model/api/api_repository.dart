import 'dart:convert';

import 'package:app_todo_lovepeople/model/deleteTodo_json.dart';
import 'package:app_todo_lovepeople/model/login_json.dart';
import 'package:app_todo_lovepeople/model/registerTodo_json.dart';
import 'package:app_todo_lovepeople/model/todoList_json.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiTodo {
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
  }


  Future<List<TodoListJson>> getTodo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');

    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');

    var response =
        await http.get(url, headers: {"Authorization": "Bearer $jwt"});
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);

      return json.map<TodoListJson>((value) {
        return TodoListJson.fromJson(value);
      }).toList();
    } else {
      return [];
    }
  }

  Future postTodo(String title, String description, String color1) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');
    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');

    var response = await http.post(url,
        body: {"title": title, "description": description, "color": color1},
        headers: {"Authorization": "Bearer $jwt"});

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      RegisterTodoJson resp = RegisterTodoJson.fromJson(json);
    }
  }
}

class DeleteTodos {
  Future<DeleteTodoJson?> deleteTodo(int? idTodo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jwt = sharedPreferences.getString('jwt');
    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos/$idTodo');

    var response =
        await http.delete(url, headers: {"Authorization": "Bearer $jwt"});

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return DeleteTodoJson.fromJson(json);
    } else {
      return null;
    }
  }
}

import 'dart:convert';


import 'package:app_todo_lovepeople/model/deleteTodo_json.dart';
import 'package:app_todo_lovepeople/model/registerTodo_json.dart';
import 'package:app_todo_lovepeople/model/todoList_json.dart';
import 'package:http/http.dart' as http;


class ApiTodo{
  String? token = '';

  Future<List<TodoListJson>> getTodo() async {
    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');

    List<TodoListJson> todoList = [];

    var response =
        await http.get(url, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
    }
    return todoList;
  }

  Future<RegisterTodoJson> postTodo(
      String title, String description, String color1) async {
    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');

    var response = await http.post(url,
        body: {"title": title, "description": description, "color": color1},
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
    }
    print(json);
  }

  Future<DeleteTodoJson> deleteTodo(int idTodo) async {
    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos/$idTodo');

    var response = await http.delete(url, headers: {"Authorization": "Bearer $token"});
  }
}




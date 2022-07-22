import 'dart:convert';

import 'package:app_todo_lovepeople/model/json_listPage.dart';
import 'package:http/http.dart' as http;

class ListPageRepository {
  Future getList() async {
    Uri url = Uri.parse('https://todo-lovepeople.herokuapp.com/todos');
    List<ListPageJson> taskList = [];
    var result = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjI0MTYxODc2LCJleHAiOjE2MjY3NTM4NzZ9.niQtSc9OmzIK993qwoujiO3o2fu4f8gkjbnkZRcxImQ"
    });
    if (result.statusCode == 200) {
      Map json = jsonDecode(result.body);
      for (var element in (json['Response'] as List)) {
        taskList.add(ListPageJson.fromJson(element));
      }
    }
  }
}

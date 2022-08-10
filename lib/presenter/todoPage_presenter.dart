import 'package:app_todo_lovepeople/model/api/api_repository.dart';
import 'package:app_todo_lovepeople/model/todoList_json.dart';
import 'package:flutter/cupertino.dart';

class TodoPagePresenter extends ChangeNotifier {
  ApiTodo api;
  DeleteTodos delete;

  TodoPagePresenter(this.api, this.delete);

  List<TodoListJson> tasks = [];
  final List<TodoListJson> _filterTodos = [];

  void getTodosList() async {
    tasks = await api.getTodo();
    notifyListeners();
  }

  void removeTodo(TodoListJson taskList) {
    delete.deleteTodo(taskList.id).then((response) {
      if (response != null) {
        tasks.remove(taskList);
      }
    });
    notifyListeners();
  }

  void filters(String filter) {
    tasks = _filterTodos
        .where((element) =>
            element.title!.toLowerCase().contains(filter.toLowerCase()) ||
            element.description!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    notifyListeners();
  }
}

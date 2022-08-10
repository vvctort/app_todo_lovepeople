import 'package:app_todo_lovepeople/model/api/api_repository.dart';
import 'package:flutter/cupertino.dart';

class RegisterTodoPresenter extends ChangeNotifier {
  final api = ApiTodo();

  void newTask(String title, String description, String color1,
      VoidCallback sucesso, VoidCallback falhou) {
    api.postTodo(title, description, color1).then((value) {
      sucesso();
    }).onError((error, _) {
      falhou();
    });
  }
}

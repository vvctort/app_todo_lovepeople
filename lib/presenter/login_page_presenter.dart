import 'package:app_todo_lovepeople/model/api/api_repository.dart';
import 'package:app_todo_lovepeople/model/login_json.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPresenter extends ChangeNotifier {
final api = ApiTodo();
  LoginPageJson? logins;
  bool carregar = false;

  void obterLogin(
      String email, String senha, VoidCallback sucesso, VoidCallback falhou) {
    carregamento(true);
    api.login(email, senha).then((value) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('jwt', value!.jwt!);
      sucesso();
    }).onError((erro, _) {
      falhou();
    });
  }

  void carregamento(bool correto) {
    postFrame(() {
      carregar = correto;
      notifyListeners();
    });
  }

  Future<bool> verificacaoToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('jwt') != null) {
      return true;
    } else {
      return false;
    }
  }
}

void postFrame(Function execute) {
  Future.delayed(Duration.zero, () {
    execute();
  });
}
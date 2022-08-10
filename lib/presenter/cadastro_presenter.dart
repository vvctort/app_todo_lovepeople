import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_todo_lovepeople/model/api/api_repository.dart';
import 'package:app_todo_lovepeople/model/login_json.dart';
import 'package:flutter/foundation.dart';

class CadastroPresenter extends ChangeNotifier {
  final api = ApiTodo();

  void obterLogin(String email, String senha, String nome, VoidCallback sucesso,
      VoidCallback falhou) {
    api.cadastro(email, nome, senha).then((value) async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('jwt', '${value?.jwt}');
      sucesso();
    }).onError((error, _) {
      falhou();
    });
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('jwt') != null) {
      return true;
    } else {
      return false;
    }
  }
}
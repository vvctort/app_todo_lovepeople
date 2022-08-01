import 'package:app_todo_lovepeople/view/tela_login.dart';
import 'package:app_todo_lovepeople/view/prancheta2_page.dart';
import 'package:app_todo_lovepeople/view/prancheta4_page.dart';
import 'package:app_todo_lovepeople/view/prancheta5_page.dart';
import 'package:app_todo_lovepeople/view/prancheta3_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lista de tarefas',
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case '/cadastro':
            return MaterialPageRoute(builder: (context) => const Cadastro());
          case '/list':
            return MaterialPageRoute(builder: (context) => const ListPage());
          case '/form':
            return MaterialPageRoute(builder: (context) => const FormPage());
          case '/CadastroConcluido':
            return MaterialPageRoute(
              builder: (context) => const SingInPage(),
            );
        }
        return null;
      },
    );
  }
}

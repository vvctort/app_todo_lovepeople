import 'package:app_todo_lovepeople/view/prancheta2_page.dart';

import 'package:app_todo_lovepeople/view/prancheta4_page.dart';
import 'package:app_todo_lovepeople/view/prancheta5_page.dart';
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
      initialRoute: '/cadastro',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/cadastro':
            return MaterialPageRoute(builder: (context) => const Cadastro());
          case '/list':
            return MaterialPageRoute(builder: (context) => const ListPage());
          case '/form':
            return MaterialPageRoute(builder: (context) => const FormPage());
        }
        return null;
      },
    );
  }
}

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
      initialRoute: '/list',
      routes: {
        '/list': (context) => const ListPage(),
        '/createTask':(context) => CreateTask(),
      },
    );
  }
}

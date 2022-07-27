import 'package:app_todo_lovepeople/view/prancheta4_page.dart';
import 'package:flutter/material.dart';
import 'package:app_todo_lovepeople/view/prancheta3_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lista de tarefas',
      home: SingInPage(),
    );
  }
}

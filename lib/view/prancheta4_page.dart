import 'package:app_todo_lovepeople/model/todoList_json.dart';
import 'package:app_todo_lovepeople/presenter/todoPage_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    context.read<TodoPagePresenter>().getTodosList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      body: Consumer<TodoPagePresenter>(builder: (_, presenter, snapshot) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 2, bottom: 4),
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset(
                          'assets/images/logo_coruja.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Suas listagens',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Montserrat-SemiBold',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(left: 14),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  onChanged: (todos) {
                    presenter.filters(todos);
                  },
                  decoration: InputDecoration(
                    iconColor: const Color.fromARGB(255, 49, 1, 185),
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 49, 1, 185)),
                    labelText: 'Busque palavras-chave',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 35,
                        color: Color.fromARGB(255, 49, 1, 185),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: presenter.tasks.length,
                      itemBuilder: (context, index) {
                        final todo = presenter.tasks[index];
                        return taskCard(presenter, todo, context);
                      })),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 143,
                  ),
                  IconButton(
                    iconSize: 90,
                    onPressed: () {
                      Navigator.pushNamed(context, '/form').then((value) {
                        if (value = true) {
                          presenter.getTodosList();
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget taskCard(TodoPagePresenter presenter, TodoListJson taskList,
      BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 0,
        color: setColor(taskList.color),
        child: Center(
          child: ListTile(
            title: Text(
              taskList.title ?? '',
              style: const TextStyle(
                  fontFamily: 'Montserrat-SemiBold',
                  color: Color.fromARGB(255, 49, 1, 185),
                  fontSize: 20),
            ),
            subtitle: Text(
              taskList.description ?? '',
              maxLines: 4,
              style: const TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 49, 1, 185),
              ),
            ),
            trailing: IconButton(
              iconSize: 40,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.only(bottom: 360, top: 200),
                    child: AlertDialog(
                      insetPadding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      title: const Text(
                        'Deseja deletar este item?',
                        style: TextStyle(
                            fontFamily: 'MontSerrat-Semibold',
                            color: Color.fromARGB(255, 49, 1, 185)),
                      ),
                      content: Text(
                        "${taskList.title!} sera movido para lixeira",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 49, 1, 185)),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            presenter.removeTodo(taskList);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Confirmar',
                            style: TextStyle(
                                color: Color.fromARGB(255, 49, 1, 185)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                                color: Color.fromARGB(255, 169, 1, 247)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(
                CupertinoIcons.trash,
                color: Color.fromARGB(255, 49, 1, 185),
              ),
            ),
          ),
        ),
      ),
    );
  }

  setColor(String? color) {
    try {
      return Color(int.parse('0xFF${color?.replaceAll('#', '')}'));
    } catch (e) {
      return Colors.transparent;
    }
  }
}

















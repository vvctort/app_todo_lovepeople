import 'package:app_todo_lovepeople/presenter/registerTodo_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _colorTarefa = '';
  final _colorsTarefas = ['FFF2CC', 'FFD9F0', 'E8C5FF', 'CAFBFF', 'E3FFE6'];
  int cor = 10;
  final TextEditingController _titleTaskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      body: Consumer<RegisterTodoPresenter>(builder: (_, presenter, snapshot) {
        return SafeArea(
          child: SingleChildScrollView(
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
                      width: 60,
                    ),
                    Column(
                      children: const [
                        SizedBox(
                          height: 27,
                        ),
                        Text(
                          'Nova Tarefa',
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 14),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: cor == 1
                              ? const Color.fromARGB(255, 255, 242, 204)
                              : cor == 2
                                  ? const Color.fromARGB(255, 255, 217, 240)
                                  : cor == 3
                                      ? const Color.fromARGB(255, 232, 197, 255)
                                      : cor == 4
                                          ? const Color.fromARGB(
                                              255, 202, 251, 255)
                                          : cor == 5
                                              ? const Color.fromARGB(
                                                  255, 227, 255, 230)
                                              : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preenchimento obrigatório';
                            }
                            return null;
                          },
                          controller: _titleTaskController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text(
                              'Título da Tarefa',
                              style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 49, 1, 185),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 300,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: cor == 1
                              ? const Color.fromARGB(255, 255, 242, 204)
                              : cor == 2
                                  ? const Color.fromARGB(255, 255, 217, 240)
                                  : cor == 3
                                      ? const Color.fromARGB(255, 232, 197, 255)
                                      : cor == 4
                                          ? const Color.fromARGB(
                                              255, 202, 251, 255)
                                          : cor == 5
                                              ? const Color.fromARGB(
                                                  255, 227, 255, 230)
                                              : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preenchimento obrigatório';
                            }
                            return null;
                          },
                          controller: _descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 17,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Escreva uma descrição para sua tarefa.',
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 49, 1, 185)
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    mapaDeCores(1),
                    mapaDeCores(2),
                    mapaDeCores(3),
                    mapaDeCores(4),
                    mapaDeCores(5),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 80,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      icon:
                          const Icon(Icons.close_rounded, color: Colors.white),
                    ),
                    const SizedBox(width: 100),
                    IconButton(
                      iconSize: 80,
                      onPressed: () {
                        String title = _titleTaskController.text;
                        String description = _descriptionController.text;
                        if (title.isNotEmpty && description.isNotEmpty) {
                          presenter.newTask(title, description, _colorTarefa,
                              () {
                            Navigator.pop(context, true);
                          }, () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Sua tarefa nao foi cadastrada'),
                              ),
                            );
                          });
                        }
                      },
                      icon: const Icon(Icons.done_rounded, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  getColor(int numero) {
    switch (numero) {
      case 1:
        return cor = 1;

      case 2:
        return cor = 2;

      case 3:
        return cor = 3;

      case 4:
        return cor = 4;

      case 5:
        return cor = 5;

      default:
        return cor = 0;
    }
  }

  mapaDeCores(int i) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _colorsTarefas.length,
      itemBuilder: (context, index) {
        final colorButton = '0xFF${_colorsTarefas[index]}';
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: Color(
              int.parse(colorButton),
            ),
            elevation: _colorTarefa == _colorsTarefas[index] ? 10 : 0,
          ),
          onPressed: () {
            setState(() {
              _colorTarefa = _colorsTarefas[index];
              getColor(i);
            });
          },
          child: const SizedBox(
            width: 20,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // @override
  // void initState() {
  //   context.read<RegisterPagePresenter>().postNewTodos();
  //   super.initState();
  // }

  int cor = 10;
  TextEditingController titleTaskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      body: SafeArea(
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

                    // child: Image.asset(
                    //   'assets/images/logo_coruja.png',
                    //   width: 120,
                    //   height: 120,
                    // ),
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
              Column(
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
                                      ? const Color.fromARGB(255, 202, 251, 255)
                                      : cor == 5
                                          ? const Color.fromARGB(
                                              255, 227, 255, 230)
                                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        titleTaskController.text = value;
                      },
                      controller: titleTaskController,
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
                                      ? const Color.fromARGB(255, 202, 251, 255)
                                      : cor == 5
                                          ? const Color.fromARGB(
                                              255, 227, 255, 230)
                                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
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
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 242, 204),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: InkWell(onTap: () {
                      setState(() {
                        getColor(1);
                      });
                    }),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 217, 240),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: InkWell(onTap: () {
                      setState(() {
                        getColor(2);
                      });
                    }),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 197, 255),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: InkWell(onTap: () {
                      setState(() {
                        getColor(3);
                      });
                    }),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 202, 251, 255),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: InkWell(onTap: () {
                      setState(() {
                        getColor(4);
                      });
                    }),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 255, 230),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          getColor(5);
                        });
                      },
                    ),
                  ),
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
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                  ),
                  const SizedBox(width: 100),
                  IconButton(
                    iconSize: 80,
                    onPressed: () {},
                    icon: const Icon(Icons.done_rounded, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getColor(int numero) {
    switch (numero) {
      case 1:
        return cor = 1;
        break;
      case 2:
        return cor = 2;
        break;
      case 3:
        return cor = 3;
        break;
      case 4:
        return cor = 4;
        break;
      case 5:
        return cor = 5;
        break;
      default:
        return cor = 0;
    }
  }
}

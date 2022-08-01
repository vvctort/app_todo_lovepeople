import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 2, bottom: 4),
                  width: 500,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200),
                      bottomLeft: Radius.circular(200),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 180,
                          width: 180,
                          child: Image.asset(
                            'assets/images/logo_coruja.png',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 145),
                        child: Text(
                          'Lovepeople',
                          style: TextStyle(
                              color: Color.fromARGB(255, 49, 1, 185),
                              fontFamily: 'Montserrat-Bold'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    'Que bom que voltou!',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat-SemiBold',
                        fontSize: 27),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          onChanged: (text) {
                            email = text;
                          },
                          controller: emailController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'campo em branco';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Numero de telefone, email ou CPF',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 49, 1, 185)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          onChanged: (text) {
                            password = text;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 49, 1, 185)),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              suffixIcon: Icon(Icons.remove_red_eye)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 10),
                  child: Row(
                    children: [
                      const Text(
                        'Esqueceu seu login ou senha?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Clique aqui',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 214, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, '/CadastroConcluido');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(
                          255,
                          49,
                          1,
                          185,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Colors.white)),
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(fontFamily: 'Montserrat-SemiBold'),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  children: List.generate(
                      150 ~/ 1,
                      (index) => Expanded(
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : Colors.grey,
                              height: 2,
                            ),
                          )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Nao possui cadastro?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/cadastro');
                      },
                      child: const Text(
                        'Clique aqui',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 214, 0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

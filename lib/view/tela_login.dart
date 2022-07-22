import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox
         width: MediaQuery.of(context).size.width
         height: MediaQuery.of(context).size.height
         child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            TextField(
             onChanged: (text){
              email = text;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
            labelText: 'email',
            border: OutlineInputBorder(),
          ),
        ),
       SizedBox(height: 10,)
       TextField (
        onChanged: (text) {
          password = text;
        },
        obscureText: true,
          decoration: const InputDecoration(
            labelText: 'password',
            border: OutlineInputBorder (),
          ),
       ),
      const SizedBox( height: 15,),
       ElevatedButton(
        onPressed: () {
          if (email == 'mari_moreira1234@hotmail.com' && password == '123') {
          print ('correto');
          } else {
            print ('login invalido');
               }
              },
              child:const Text ('Entrar'),
            )
           ],
          ),
         ),
      ),
    );
  }
}
      
       

            

























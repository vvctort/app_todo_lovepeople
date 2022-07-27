// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 169, 1, 247),
        body: Center(
          child: Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Text(
              'Cadastro Concluído!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Montserrat-SemiBold'),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: (() {}),
                child: Container(
                  padding: EdgeInsets.only(top: 2.5),
                  child: Text('Começar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Montserrat-SemiBold'),
                      textAlign: TextAlign.center),
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 49, 1, 185),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                )),
            SizedBox(
              height: 160,
            ),
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                      topRight: Radius.circular(200),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero),
                  color: Colors.white,
                ),
                height: 230,
                width: 412,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/coruja_voando.png',
                      height: 170,
                    ),
                    Text(
                      'Os ventos da programação estão indo até você',
                      style: TextStyle(
                          color: Color.fromARGB(255, 49, 1, 185),
                          fontSize: 15,
                          fontFamily: 'Montserrat-SemiBold'),
                    )
                  ],
                ))
          ])),
        ));
  }
}

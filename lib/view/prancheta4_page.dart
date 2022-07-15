import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 85,
                      height: 85,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(1000),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/logo_coruja.png',
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Suas listagens',
                  style: TextStyle(color: Colors.white, fontSize: 30),
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
                decoration: InputDecoration(
                  iconColor: const Color.fromARGB(255, 49, 1, 185),
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 49, 1, 185)),
                  labelText: 'Busque palavras-chave',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 40),
                  ),
                ),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text(
                  'Limpar a casa',
                ),
                style: ListTileStyle.drawer,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
    );
  }
}

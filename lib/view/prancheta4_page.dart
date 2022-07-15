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
                      width: 75,
                      height: 75,
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
                Column(
                  children: const [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Suas listagens',
                      style: TextStyle(color: Colors.white, fontSize: 25),
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
            taskCard(const Color.fromARGB(255, 255, 242, 204)),
            const SizedBox(
              height: 20,
            ),
            taskCard(const Color.fromARGB(255, 199, 255, 203)),
            const SizedBox(
              height: 20,
            ),
            taskCard(const Color.fromARGB(255, 232, 197, 255)),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 169, 1, 247),
    );
  }

  Widget taskCard(text) {
    return SizedBox(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        elevation: 0,
        color: text,
        child: Center(
          child: ListTile(
            title: const Text(
              'Limpar a casa',
            ),
            subtitle: const Text(
              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore ‘erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.',
              maxLines: 4,
              style: TextStyle(fontSize: 14),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
      ),
    );
  }
}

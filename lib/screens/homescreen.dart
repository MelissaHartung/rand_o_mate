import 'package:flutter/material.dart';
import 'package:rand_o_mate/screens/widgets/zufallsrad.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(249, 34, 142, 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.food_bank_outlined),
              title: Text('Rezepte'),
            ),
            ListTile(
              leading: Icon(Icons.catching_pokemon_outlined),
              title: Text('Aktivitäten'),
            ),
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text('Filme'),
            ),
          ],
        ),
      ),

      body: const Center(child: Zufallsrad()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

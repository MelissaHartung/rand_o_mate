import 'package:flutter/material.dart';
import 'package:rand_o_mate/screens/widgets/zufallsrad.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 8, 8, 8),
      appBar: AppBar(backgroundColor: Color.fromARGB(248, 0, 0, 0)),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(248, 58, 58, 58),
        child: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.food_bank_outlined),
              title: Text(style: TextStyle(color: Colors.white), 'Rezepte'),
            ),
            ListTile(
              leading: Icon(Icons.catching_pokemon_outlined),
              title: Text(style: TextStyle(color: Colors.white), 'Aktivitäten'),
            ),
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text(style: TextStyle(color: Colors.white), 'Filme'),
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                hint: const Text("Kategorie auswählen"),
                underline: const SizedBox(),
                onChanged: (String? value) {},
                items: const [
                  DropdownMenuItem(value: 'Rezepte', child: Text('Rezepte')),
                  DropdownMenuItem(
                    value: 'Aktivitäten',
                    child: Text('Aktivitäten'),
                  ),
                  DropdownMenuItem(value: 'Filme', child: Text('Filme')),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(width: 400, height: 400, child: Zufallsrad()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

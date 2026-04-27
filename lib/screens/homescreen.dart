import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rand_o_mate/model/zufallgenerator.dart';
import 'package:rand_o_mate/screens/%C3%BCbersichtenscreens/uebersichtspage.dart';
import 'package:rand_o_mate/screens/Add_dialog/add_enrty_dialog.dart';
import 'package:rand_o_mate/screens/widgets/zufallsrad.dart';
import 'package:rand_o_mate/services/zufallgenerator_services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String? selectedCategory = 'Rezepte';
  List<Zufallgenerator> wheelItems = [];
  final ZufallgeneratorServices zufallgeneratorServices = ZufallgeneratorServices();
  Zufallgenerator? selectedResult;
  final StreamController<int> auswahl = StreamController<int>();
  @override
  void initState() {
    super.initState();
    wheelItems = zufallgeneratorServices.loadwheelItems('Rezepte');
  }

  void spinWheel() {
    if (wheelItems.isEmpty) return;
    final random = Random();
    final randomIndex = random.nextInt(wheelItems.length);
    auswahl.add(randomIndex);

    setState(() {
      selectedResult = wheelItems[randomIndex];
    });
  }

  void updateWheelItems() {
    if (selectedCategory != null) {
      setState(() {
        wheelItems = zufallgeneratorServices.loadwheelItems(selectedCategory!);
      });
    }
  }

  @override
  void dispose() {
    auswahl.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 220, 186, 240),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 220, 186, 240),
        title: Text('Rand-O-Mate', style: TextStyle(color: const Color.fromARGB(255, 37, 37, 37))),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(248, 150, 127, 163),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.search),
              title: Text(style: TextStyle(color: Colors.white), 'Suche'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(style: TextStyle(color: Colors.white), 'Einstellungen'),
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: DropdownButton<String>(
                value: selectedCategory,
                hint: Text("Kategorie auswählen"),
                underline: SizedBox(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value;
                    if (value != null) {
                      wheelItems = zufallgeneratorServices.loadwheelItems(value);
                    }
                  });
                },
                items: [
                  DropdownMenuItem(value: 'Rezepte', child: Text('Rezepte')),
                  DropdownMenuItem(value: 'Aktivitäten', child: Text('Aktivitäten')),
                  DropdownMenuItem(value: 'Filme', child: Text('Filme')),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 400,
              height: 400,
              child: InkWell(
                onTap: spinWheel,
                child: Zufallsrad(items: wheelItems, selected: auswahl.stream),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => const AddEntryDialog());
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const Uebersichtspage(category: 'Rezepte')));
          } else if (index == 1) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const Uebersichtspage(category: 'Aktivitäten')));
          } else if (index == 2) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const Uebersichtspage(category: 'Filme')));
          }
        },
        backgroundColor: Color.fromARGB(248, 222, 199, 235),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined, color: Color.fromARGB(255, 26, 26, 26)),
            label: "Rezepte",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon_outlined, color: Color.fromARGB(255, 26, 26, 26)),
            label: "Aktivitäten",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined, color: Color.fromARGB(255, 26, 26, 26)),
            label: "Filme",
          ),
        ],
      ),
    );
  }
}

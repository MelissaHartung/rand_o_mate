import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rand_o_mate/model/zufallgenerator.dart';
import 'package:rand_o_mate/screens/addpages/addAktivitaetenscreen.dart';
import 'package:rand_o_mate/screens/addpages/addRezepte.dart';
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
  final ZufallgeneratorServices zufallgeneratorServices =
      ZufallgeneratorServices();
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
      backgroundColor: Color.fromARGB(248, 8, 8, 8),
      appBar: AppBar(backgroundColor: Color.fromARGB(248, 0, 0, 0)),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(248, 58, 58, 58),
        child: ListView(
          children: <Widget>[
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
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: selectedCategory,
                hint: Text("Kategorie auswählen"),
                underline: SizedBox(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value;
                    if (value != null) {
                      wheelItems = zufallgeneratorServices.loadwheelItems(
                        value,
                      );
                    }
                  });
                },
                items: [
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
          if (selectedCategory == 'Rezepte') {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddRezepteScreen()),
            );
          } else if (selectedCategory == 'Aktivitäten') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddAktivitaetenScreen(),
              ),
            );
          } else if (selectedCategory == 'Filme') {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddFilme()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rand_o_mate/model/rezepte.dart';
import 'package:rand_o_mate/screens/widgets/rezeptcard.dart';
import 'package:rand_o_mate/services/rezepte_services.dart';

class RezepteUebersichtScreen extends StatefulWidget {
  const RezepteUebersichtScreen({super.key});

  @override
  State<RezepteUebersichtScreen> createState() =>
      _RezepteUebersichtScreenState();
}

class _RezepteUebersichtScreenState extends State<RezepteUebersichtScreen> {
  final RezepteServices _rezepteServices = RezepteServices();
  List<Rezepte> _rezepteList = [];

  @override
  void initState() {
    super.initState();
    _loadRezepte();
  }

  void _loadRezepte() {
    setState(() {
      _rezepteList = _rezepteServices.getAllRezepte();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 8, 8, 8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(248, 0, 0, 0),
        title: const Text('Rezeptuebersicht'),
      ),
      body: ListView(
        children: _rezepteList.map((rezept) {
          return RezeptCard(rezept: rezept);
        }).toList(),
      ),
    );
  }
}

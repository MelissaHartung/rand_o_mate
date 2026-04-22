import 'package:flutter/material.dart';
import 'package:rand_o_mate/model/rezepte.dart';

class RezeptCard extends StatelessWidget {
  final Rezepte rezept;

  const RezeptCard({super.key, required this.rezept});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        title: Text(rezept.title),
        subtitle: Text('Kategorie: ${rezept.category}'),
      ),
    );
  }
}

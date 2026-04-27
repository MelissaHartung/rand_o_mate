import 'package:flutter/material.dart';
import 'package:rand_o_mate/screens/Add_dialog/aktivitaeten_add_formular.dart';
import 'package:rand_o_mate/screens/Add_dialog/rezepte_add_formular.dart';

class AddEntryDialog extends StatefulWidget {
  const AddEntryDialog({super.key});

  @override
  State<AddEntryDialog> createState() => _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  String? selectedCategory = 'Rezepte';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              hint: Text("Kategorie auswählen"),
              underline: SizedBox(),
              onChanged: (String? value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              items: [
                DropdownMenuItem(value: 'Rezepte', child: Text('Rezepte')),
                DropdownMenuItem(value: 'Aktivitäten', child: Text('Aktivitäten')),
                DropdownMenuItem(value: 'Filme', child: Text('Filme')),
              ],
            ),
            if (selectedCategory == 'Rezepte') AddFormularRezepte(),
            if (selectedCategory == 'Filme') AddFormularRezepte(),
            if (selectedCategory == 'Aktivitäten') AddFormularAktivitaeten(),
          ],
        ),
      ),
    );
  }
}

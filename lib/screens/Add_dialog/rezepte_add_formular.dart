import 'package:flutter/material.dart';

class AddFormularRezepte extends StatefulWidget {
  const AddFormularRezepte({super.key});

  @override
  State<AddFormularRezepte> createState() => _AddFormularRezepteState();
}

class _AddFormularRezepteState extends State<AddFormularRezepte> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Titel', filled: true, fillColor: Colors.white),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _categoryController,
            decoration: const InputDecoration(labelText: 'Kategorie', filled: true, fillColor: Colors.white),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _ingredientsController,
            maxLines: 4,
            decoration: const InputDecoration(labelText: 'Zutaten', filled: true, fillColor: Colors.white),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _instructionsController,
            maxLines: 5,
            decoration: const InputDecoration(labelText: 'Anleitung', filled: true, fillColor: Colors.white),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Speichern'),
          ),
        ],
      ),
    );
  }
}

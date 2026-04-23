import 'package:rand_o_mate/model/rezepte.dart';

class RezepteServices {
  final List<Rezepte> _rezepte = [
    Rezepte(
      id: '1',
      title: 'Fisch',
      category: 'Italia',
      ingredients: 'Teig, Tomatensauce, Käse, Belag nach Wahl',

      instructions:
          '1. Teig ausrollen. 2. Tomatensauce auf den Teig geben. 3. Käse und Belag hinzufügen. 4. Im Ofen backen.',
    ),
    Rezepte(
      id: '2',
      title: 'Pasta Carbonara',
      category: 'Italia',
      ingredients: 'Pasta, Eier, Speck, Parmesan, Pfeffer',

      instructions:
          '1. Pasta kochen. 2. Speck anbraten. 3. Eier und Parmesan vermischen. 4. Pasta mit Speck und Eiermischung vermengen.',
    ),
    Rezepte(
      id: '3',
      title: 'Salat',
      category: 'Gesund',
      ingredients: 'Blattsalat, Tomaten, Gurken, Dressing',

      instructions:
          '1. Blattsalat waschen. 2. Tomaten und Gurken schneiden. 3. Alles vermischen und mit Dressing servieren.',
    ),
  ];

  void addRezepte(Rezepte rezept) {
    _rezepte.add(rezept);
  }

  List<Rezepte> getAllRezepte() {
    return List.from(_rezepte);
  }

  void deleteRezepte(String id) {
    for (var i = 0; i < _rezepte.length; i++) {
      if (_rezepte[i].id == id) {
        _rezepte.removeAt(i);
        break;
      }
    }
  }

  void updateRezepte(String id, Rezepte updatedRezepte) {
    for (var i = 0; i < _rezepte.length; i++) {
      if (_rezepte[i].id == id) {
        _rezepte[i] = updatedRezepte;
        break;
      }
    }
  }
}

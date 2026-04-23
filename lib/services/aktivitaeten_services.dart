import 'package:rand_o_mate/model/aktivitaeten.dart';

class AktivitaetenServices {
  final List<Aktivitaeten> _aktivitaeten = [
    Aktivitaeten(
      id: '1',
      title: 'Spazieren gehen',
      description: 'Ein entspannter Spaziergang im Park oder in der Natur.',
      ort: 'Park, Wald, Strand',
      kategorie: 'Aktivitäten',
    ),
    Aktivitaeten(
      id: '2',
      title: 'Fahrradtour',
      description: 'Eine Fahrradtour durch die Stadt oder auf dem Land.',
      ort: 'Draußen',
      kategorie: 'Aktivitäten',
    ),
    Aktivitaeten(
      id: '3',
      title: 'Kochkurs besuchen',
      description: 'Einen Kochkurs besuchen und neue Rezepte lernen.',
      ort: 'Kochschule, Restaurant',
      kategorie: 'Aktivitäten',
    ),
    Aktivitaeten(
      id: '4',
      title: 'Museumsbesuch',
      description: 'Ein Museum besuchen und Kunst oder Geschichte entdecken.',
      ort: 'Museum, Galerie',
      kategorie: 'Aktivitäten',
    ),
    Aktivitaeten(
      id: '5',
      title: 'Yoga machen',
      description: 'Eine Yoga-Session zu Hause oder im Studio machen.',
      ort: 'Home',
      kategorie: 'Aktivitäten',
    ),
  ];

  void addAktivitaeten(Aktivitaeten aktivitaet) {
    _aktivitaeten.add(aktivitaet);
  }

  List<Aktivitaeten> getAllAktivitaeten() {
    return List.from(_aktivitaeten);
  }

  void deleteAktivitaeten(String id) {
    for (var i = 0; i < _aktivitaeten.length; i++) {
      if (_aktivitaeten[i].id == id) {
        _aktivitaeten.removeAt(i);
        break;
      }
    }
  }
}

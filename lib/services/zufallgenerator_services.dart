import 'package:rand_o_mate/model/zufallgenerator.dart';
import 'package:rand_o_mate/services/aktivitaeten_services.dart';
import 'package:rand_o_mate/services/filme_services.dart';
import 'package:rand_o_mate/services/rezepte_services.dart';

class ZufallgeneratorServices {
  final AktivitaetenServices aktivitaetenservices = AktivitaetenServices();
  final RezepteServices rezeptenservices = RezepteServices();
  final FilmeServices filmeServices = FilmeServices();

  List<Zufallgenerator> loadwheelItems(String category) {
    if (category == 'Aktivitäten') {
      final aktivitaet = aktivitaetenservices.getAllAktivitaeten();
      return aktivitaet
          .map((a) => Zufallgenerator(id: a.id, title: a.title))
          .toList();
    } else if (category == 'Rezepte') {
      final rezepte = rezeptenservices.getAllRezepte();
      return rezepte
          .map((r) => Zufallgenerator(id: r.id, title: r.title))
          .toList();
    } else if (category == 'Filme') {
      final filme = filmeServices.getAllFilme();
      return filme
          .map((f) => Zufallgenerator(id: f.id, title: f.title))
          .toList();
    }
    return [];
  }
}

import 'package:rand_o_mate/model/filme.dart';

class FilmeServices {
  final List<Filme> _filme = [
    Filme(id: '1', title: 'Inception', time: '123', genre: 'Science-Fiction, Action'),
    Filme(id: '2', title: 'The Shawshank Redemption', time: '142', genre: 'Drama'),
    Filme(id: '3', time: '175', title: 'The Godfather', genre: 'Krimi, Drama'),
  ];

  void addFilme(Filme film) {
    _filme.add(film);
  }

  void deleteFilme(String id) {
    for (var i = 0; i < _filme.length; i++) {
      if (_filme[i].id == id) {
        _filme.removeAt(i);
        break;
      }
    }
  }

  List<Filme> getAllFilme() {
    return List.from(_filme);
  }
}

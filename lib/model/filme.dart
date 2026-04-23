class Filme {
  final String id;
  final String title;
  final String genre;
  final String time;

  Filme({required this.id, required this.title, required this.genre, required this.time});

  Filme.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      genre = json['genre'],
      time = json['time'];

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'genre': genre, 'time': time};
}

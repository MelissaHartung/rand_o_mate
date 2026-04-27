class Aktivitaeten {
  final String id;
  final String title;
  final String description;
  final String ort;
  final String kategorie;

  Aktivitaeten({
    required this.id,
    required this.title,
    required this.description,
    required this.ort,
    required this.kategorie,
  });

  Aktivitaeten.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      description = json['description'],
      ort = json['ort'],
      kategorie = json['kategorie'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'ort': ort,
    'kategorie': kategorie,
  };
}

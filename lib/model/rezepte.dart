class Rezepte {
  final String id;
  final String title;
  final String category;
  final String ingredients;
  final String instructions;
  final String image;

  Rezepte({
    required this.id,
    required this.title,
    required this.category,
    required this.ingredients,
    required this.instructions,
    required this.image,
  });
  Rezepte.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      category = json['category'],
      ingredients = json['ingredients'],
      instructions = json['instructions'],
      image = json['image'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'category': category,
    'ingredients': ingredients,
    'instructions': instructions,
    'image': image,
  };
}

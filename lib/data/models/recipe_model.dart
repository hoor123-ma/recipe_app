class RecipeModel {
  int id;
  String name;
  int prepTimeMinutes;
  int cookTimeMinutes;
  String cuisine;
  String difficulty;
  String imageUrl;
  List<dynamic> mealType;
  List<String> ingredients;
  List<String> instructions;

  RecipeModel({
    required this.id,
    required this.name,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.cuisine,
    required this.difficulty,
    required this.imageUrl,
    required this.mealType,
    required this.ingredients,
    required this.instructions,
  });

  // من JSON → Object
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json["id"],
      name: json["name"],
      prepTimeMinutes: json["prepTimeMinutes"],
      cookTimeMinutes: json["cookTimeMinutes"],
      cuisine: json["cuisine"],
      difficulty: json["difficulty"],
      imageUrl: json["image"],
      mealType: json["mealType"],
      ingredients: List<String>.from(json["ingredients"]),
      instructions: List<String>.from(json["instructions"]),
    );
  }

  String toString() {
    return 'RecipeModel(id: $id, name: $name, ingredients: $ingredients)';
  }
}

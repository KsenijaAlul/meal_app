class Meal {
  final String id;
  final String name;
  final String thumbnail;
  final String instructions;
  final Map<String, String> ingredients;
  final String youtubeLink;

  Meal({
    required this.id,
    required this.name,
    required this.thumbnail,
    this.instructions = '',
    this.ingredients = const {},
    this.youtubeLink = '',
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    Map<String, String> ingredients = {};
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients[ingredient] = measure ?? '';
      }
    }

    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
      instructions: json['strInstructions'] ?? '',
      ingredients: ingredients,
      youtubeLink: json['strYoutube'] ?? '',
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

//Get the recipe
class RecipeFromApi {
  final int id, totalTime, serves;
  final String title, image;

  RecipeFromApi({
    required this.id,
    required this.title,
    required this.image,
    required this.totalTime,
    required this.serves,
  });
  factory RecipeFromApi.fromMap(Map<String, dynamic> map) {
    return RecipeFromApi(
      id: map['id'],
      totalTime: map['readyInMinutes'],
      serves: map['servings'],
      title: map['title'],
      image: map['image'],
    );
  }

  // @override
  // String toString() {
  //   return 'Recipe {id: $id, name: $title, image: $image, servings: $serves, totalTime: $totalTime}';
  // }
}

class RecipeManager {
  List<RecipeFromApi> _recipes = [];

  List<RecipeFromApi> get recipes => _recipes;

  Future<void> fetchData() async {
    final url =
        'https://api.spoonacular.com/recipes/random?number=20&apiKey=6f4fe875f0fd4edc9b34539deabd7bf7';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('API ok');
        final data = json.decode(response.body) as Map<String, dynamic>;
        final recipes = data['recipes'] as List<dynamic>;

        _recipes.clear();
        for (final recipe in recipes) {
          _recipes.add(RecipeFromApi.fromMap(recipe));
          print('Recipes add succesfully');
        }
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

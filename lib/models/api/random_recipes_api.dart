import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/models/api/api_key.dart';

String decodeText(String originalText) {
  return utf8.decode(utf8.encode(originalText));
}

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'readyInMinutes': totalTime,
      'servings': serves,
    };
  }

  factory RecipeFromApi.fromMap(Map<String, dynamic> map) {
    return RecipeFromApi(
      id: map['id'],
      totalTime: map['readyInMinutes'],
      serves: map['servings'],
      title: decodeText(map['title']),
      image: map['image'],
    );
  }

  @override
  String toString() {
    return 'Recipe {id: $id, name: $title, image: $image, servings: $serves, totalTime: $totalTime}';
  }
}

class RecipeManager {
  List<RecipeFromApi> _recipes = [];

  List<RecipeFromApi> get recipes => _recipes;

  final apikey = APIKey();

  Future<void> fetchData() async {
    final url =
        'https://api.spoonacular.com/recipes/random?number=5&apiKey=${apikey.apikey2}';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('API ok');
        final data = json.decode(response.body) as Map<String, dynamic>;
        final recipes = data['recipes'] as List<dynamic>;

        _recipes.clear();
        for (final recipe in recipes) {
          _recipes.add(RecipeFromApi.fromMap(recipe));
          // print(recipes);
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

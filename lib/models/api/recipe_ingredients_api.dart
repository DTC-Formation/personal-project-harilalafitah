import 'dart:convert';

import 'package:http/http.dart' as http;

// Get the ingredients by ID
class Ingredient {
  final Measurement metric;
  final String name;

  Ingredient({
    required this.metric,
    required this.name,
  });

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      metric: Measurement.fromMap(map['amount']['metric'] ?? {}),
      name: map['name'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Ingredient {metric: $metric, name: $name}';
  }
}

class Measurement {
  final String unit;
  final double value;

  Measurement({
    required this.unit,
    required this.value,
  });

  factory Measurement.fromMap(Map<String, dynamic> map) {
    return Measurement(
      unit: map['unit'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'Measurement {unit: $unit, value: $value}';
  }
}

class IngredientManager {
  List<Ingredient> ingredients = [];

  Future<void> fetchData2(int recipeId) async {
    final url =
        'https://api.spoonacular.com/recipes/$recipeId/ingredientWidget.json?apiKey=28525db30a324e328b38c3c422c4f6b3';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('API ok');
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> ingredientDataList = data['ingredients'] ?? [];

        ingredients.clear();
        for (final ingredientData in ingredientDataList) {
          ingredients.add(Ingredient.fromMap(ingredientData));
          print('Ingredient added successfully');
        }
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

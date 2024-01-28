import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/models/api/api_key.dart';

// Get the ingredients by ID
class Ingredient {
  final Measurement metric;
  final String name;

  Ingredient({
    required this.metric,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'metric': metric.toMap(),
      'name': name,
    };
  }

  // factory Ingredient.fromMap(Map<String, dynamic>? map) {
  //   if (map == null) {
  //     return Ingredient(metric: Measurement(unit: '', value: 0.0), name: '');
  //   }

  //   final Map<String, dynamic>? amountMap =
  //       map['amount'] as Map<String, dynamic>?;

  //   if (amountMap == null || amountMap['metric'] == null) {
  //     // Handle the case where 'amount' or 'metric' is null
  //     return Ingredient(
  //         metric: Measurement(unit: '', value: 0.0), name: map['name'] ?? '');
  //   }

  //   final Map<String, dynamic>? metricAmountMap =
  //       amountMap['metric'] as Map<String, dynamic>?;

  //   return Ingredient(
  //     metric: metricAmountMap != null
  //         ? Measurement.fromMap(metricAmountMap)
  //         : Measurement(unit: '', value: 0.0),
  //     name: map['name'] ?? '',
  //   );
  // }

  factory Ingredient.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return Ingredient(metric: Measurement(unit: '', value: 0.0), name: '');
    }

    final Map<String, dynamic>? metricMap =
        map['metric'] as Map<String, dynamic>?;

    return Ingredient(
      metric: metricMap != null
          ? Measurement.fromMap(metricMap)
          : Measurement(unit: '', value: 0.0),
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

  Map<String, dynamic> toMap() {
    return {
      'unit': unit,
      'value': value,
    };
  }

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

  final apikey = APIKey();

  Future<void> fetchData2(int recipeId) async {
    final url =
        'https://api.spoonacular.com/recipes/$recipeId/ingredientWidget.json?apiKey=${apikey.apikey2}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('API ok');
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> ingredientDataList = data['ingredients'] ?? [];

        ingredients.clear();
        for (final ingredientData in ingredientDataList) {
          final Measurement metric = Measurement(
            unit: ingredientData['amount']['metric']['unit'] ?? '',
            value:
                ingredientData['amount']['metric']['value']?.toDouble() ?? 0.0,
          );

          final Ingredient ingredient = Ingredient(
            metric: metric,
            name: ingredientData['name'] ?? '',
          );

          ingredients.add(ingredient);
          print('Ingredient added successfully!');
        }
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/models/api/api_key.dart';

//Get the recipe nutrition by ID
class Nutrient {
  final String name;
  final double amount;
  final String unit;
  final double percentOfDailyNeeds;

  Nutrient({
    required this.name,
    required this.amount,
    required this.unit,
    required this.percentOfDailyNeeds,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'unit': unit,
      'percentOfDailyNeeds': percentOfDailyNeeds,
    };
  }

  factory Nutrient.fromMap(Map<String, dynamic> map) {
    return Nutrient(
      name: map['name'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      unit: map['unit'] ?? '',
      percentOfDailyNeeds: map['percentOfDailyNeeds']?.toDouble() ?? 0.0,
    );
  }
  @override
  String toString() {
    return 'Nutrient {name: $name, amount: $amount $unit, percentOfDailyNeeds: $percentOfDailyNeeds}';
  }
}

// Get the nutrients of a specific recipe by it's ID from the API
class NutrientManager {
  List<Nutrient> nutrients = [];

  final apikey = APIKey();

  Future<void> fetchNutrientsData(int recipeId) async {
    final url =
        'https://api.spoonacular.com/recipes/$recipeId/nutritionWidget.json?apiKey=${apikey.apikey2}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('API ok');
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> nutrientsData = data['nutrients'] ?? [];

        nutrients.clear();

        for (int i = 0; i < 4 && i < nutrientsData.length; i++) {
          nutrients.add(Nutrient.fromMap(nutrientsData[i]));
          print('Nutrient added successfully');
        }
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

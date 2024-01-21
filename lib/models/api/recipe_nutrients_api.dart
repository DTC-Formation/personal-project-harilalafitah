import 'dart:convert';

import 'package:http/http.dart' as http;

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

  factory Nutrient.fromMap(Map<String, dynamic> map) {
    return Nutrient(
      name: map['name'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      unit: map['unit'] ?? '',
      percentOfDailyNeeds: map['percentOfDailyNeeds']?.toDouble() ?? 0.0,
    );
  }
  // @override
  // String toString() {
  //   return 'Nutrient {name: $name, amount: $amount $unit, percentOfDailyNeeds: $percentOfDailyNeeds}';
  // }
}

class NutrientManager {
  List<Nutrient> nutrients = [];

  Future<void> fetchData(int recipeId) async {
    final url =
        'https://api.spoonacular.com/recipes/$recipeId/nutritionWidget.json?apiKey=6f4fe875f0fd4edc9b34539deabd7bf7';

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

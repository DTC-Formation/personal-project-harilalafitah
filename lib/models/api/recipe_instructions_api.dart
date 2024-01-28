import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes_app/models/api/api_key.dart';

//Get the recipe instructions by ID
class AnalyzedInstructions {
  final String name;
  final List<InstructionStep> steps;

  AnalyzedInstructions({
    required this.name,
    required this.steps,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'steps': steps.map((step) => step.toMap()).toList(),
    };
  }

  factory AnalyzedInstructions.fromMap(Map<String, dynamic> map) {
    return AnalyzedInstructions(
      name: map['name'] ?? '',
      steps: (map['steps'] as List<dynamic>?)
              ?.map((step) => InstructionStep.fromMap(step))
              .toList() ??
          [],
    );
  }

  @override
  String toString() {
    return 'AnalyzedInstructions {name: $name, steps: $steps}';
  }
}

class InstructionStep {
  final int number;
  final String step;

  InstructionStep({
    required this.number,
    required this.step,
  });

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'step': step,
    };
  }

  factory InstructionStep.fromMap(Map<String, dynamic> map) {
    return InstructionStep(
      number: map['number'] ?? 0,
      step: map['step'] ?? '',
    );
  }
  @override
  String toString() {
    return 'InstructionStep {number: $number, step: $step}';
  }
}

class InstructionsManager {
  List<AnalyzedInstructions> instructs = [];

  final apikey = APIKey();

  Future<void> fetchDataForRecipe(int recipeId) async {
    final url =
        'https://api.spoonacular.com/recipes/$recipeId/analyzedInstructions?apiKey=${apikey.apikey2}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('API ok');
        final List<dynamic> data = json.decode(response.body);

        instructs.clear();
        for (final instructionData in data) {
          if (instructionData['steps'] != null) {
            instructs.add(AnalyzedInstructions.fromMap(instructionData));
            print('Instruction added successfully');
          }
        }
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

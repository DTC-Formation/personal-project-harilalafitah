import 'dart:convert';

import 'package:recipes_app/database/db_helper.dart';
import 'package:recipes_app/models/api/random_recipes_api.dart';
import 'package:recipes_app/models/api/recipe_ingredients_api.dart';
import 'package:recipes_app/models/api/recipe_instructions_api.dart';
import 'package:recipes_app/models/api/recipe_nutrients_api.dart';

class RecipeInfo {
  int? id;
  final RecipeFromApi recipe;
  final List<AnalyzedInstructions> instructions;
  final List<Ingredient> ingredients;
  final List<Nutrient> nutrients;
  late bool isLiked;
  double rating;

  RecipeInfo({
    this.id,
    required this.recipe,
    required this.instructions,
    required this.ingredients,
    required this.nutrients,
    required this.isLiked,
    this.rating = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'recipe': recipe.toMap(), // Update this line
      'instructions': json.encode(instructions.map((i) => i.toMap()).toList()),
      'ingredients': json.encode(ingredients.map((i) => i.toMap()).toList()),
      'nutrients': json.encode(nutrients.map((n) => n.toMap()).toList()),
      'isLiked': isLiked,
      'rating': rating,
    };
  }

  factory RecipeInfo.fromMap(Map<String, dynamic> map) {
    return RecipeInfo(
      id: map['id'],
      recipe: RecipeFromApi.fromMap(json.decode(map['recipe'])),
      instructions: (json.decode(map['instructions']) as List<dynamic>)
          .map((i) => AnalyzedInstructions.fromMap(i))
          .toList(),
      ingredients: (json.decode(map['ingredients']) as List<dynamic>)
          .map((i) => Ingredient.fromMap(i))
          .toList(),
      nutrients: (json.decode(map['nutrients']) as List<dynamic>)
          .map((n) => Nutrient.fromMap(n))
          .toList(),
      isLiked: map['isLiked'] == 0,
      rating: map['rating'] ?? 0.0,
    );
  }

  void toggleLiked() {
    isLiked = !isLiked;
  }

  // @override
  // String toString() {
  //   return 'RecipeInfo {'
  //       'id: $id, '
  //       'recipe: $recipe, '
  //       'instructions: $instructions, '
  //       'ingredients: $ingredients, '
  //       'nutrients: $nutrients, '
  //       'isLiked: $isLiked, '
  //       'rating: $rating'
  //       '}';
  // }
}

class GetRecipeData {
  static final RecipeManager recipeManager = RecipeManager();
  static final List<RecipeInfo> _recipeInfos = [];

  static List<RecipeInfo> get recipeInfos => _recipeInfos;

  static Future<void> fetchDataAndBuildRecipeInfos() async {
    try {
      await recipeManager.fetchData();

      // _recipeInfos.clear();

      if (recipeManager.recipes.isNotEmpty) {
        for (var recipe in recipeManager.recipes) {
          int recipeId = recipe.id;

          final InstructionsManager instructionsManager = InstructionsManager();
          final IngredientManager ingredientsManager = IngredientManager();
          final NutrientManager nutrientsManager = NutrientManager();

          await instructionsManager.fetchDataForRecipe(recipeId);
          await ingredientsManager.fetchData2(recipeId);
          await nutrientsManager.fetchData(recipeId);

          _recipeInfos.add(RecipeInfo(
            recipe: recipe,
            instructions: instructionsManager.instructs,
            ingredients: ingredientsManager.ingredients,
            nutrients: nutrientsManager.nutrients,
            isLiked: false,
          ));
        }
      } else {
        print('No recipes available');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  static Future insertData() async {
    DbHelper.dbHelper.insertNewRecipes(GetRecipeData._recipeInfos);
    // print(_recipeInfos);
    print('Data DB insere!'); // Pass the list
  }
}

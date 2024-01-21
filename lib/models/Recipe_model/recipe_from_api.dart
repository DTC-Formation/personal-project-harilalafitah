import 'package:recipes_app/models/api/random_recipes_api.dart';
import 'package:recipes_app/models/api/recipe_ingredients_api.dart';
import 'package:recipes_app/models/api/recipe_instructions_api.dart';
import 'package:recipes_app/models/api/recipe_nutrients_api.dart';

class RecipeInfo {
  final RecipeFromApi recipe;
  final List<AnalyzedInstructions> instructions;
  final List<Ingredient> ingredients;
  final List<Nutrient> nutrients;
  bool isLiked;
  double rating;

  RecipeInfo({
    required this.recipe,
    required this.instructions,
    required this.ingredients,
    required this.nutrients,
    this.isLiked = false,
    this.rating = 0.0,
  });

  void toggleLiked() {
    isLiked = !isLiked;
  }

  // @override
  // String toString() {
  //   return 'RecipeInfo {'
  //       'recipe: $recipe, '
  //       'instructions: $instructions, '
  //       'ingredients: $ingredients, '
  //       'nutrients: $nutrients'
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
          ));
        }
      } else {
        print('No recipes available');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}

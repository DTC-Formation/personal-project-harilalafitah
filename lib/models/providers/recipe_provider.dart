import 'package:flutter/foundation.dart';
import 'package:recipes_app/database/db_helper.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeProvider() {
    getRecipes();
    getRandomRecipes();
  }

  // List of recipe for all the recipes from DB
  List<RecipeInfo> recipeInfo = [];

  // List of recipe for the favorite recipes
  List<RecipeInfo> favoriteRecipes = [];

  // random recipe for the home screen
  List<RecipeInfo> randomRecipes = [];

  // Get the recipes from the DB
  getRecipes() async {
    recipeInfo = await DbHelper.dbHelper.getAllRecipes();
    favoriteRecipes = recipeInfo.where((e) => e.isLiked).toList();
    notifyListeners();
  }

  // Update a recipe in the DB
  updateRecipe(RecipeInfo recipeInfo) {
    DbHelper.dbHelper.updateRecipe(recipeInfo);
    getRecipes();
  }

  updateIsLiked(RecipeInfo recipeInfo) {
    DbHelper.dbHelper.updateIsLiked(recipeInfo);
    getRecipes();
  }

  updateRating(RecipeInfo recipeInfo, double newRating) {
    DbHelper.dbHelper.updateRating(recipeInfo, newRating);
    getRecipes();
  }

  // Delete a recipe from the DB
  deleteRecipe(RecipeInfo recipeInfo) {
    DbHelper.dbHelper.deleteRecipe(recipeInfo);
    getRecipes();
  }

  // Get random recipes
  getRandomRecipes() async {
    List<RecipeInfo> allRecipes = await DbHelper.dbHelper.getAllRecipes();

    // Shuffle the list of all recipes
    allRecipes.shuffle();

    // Take the first 10 recipes or fewer if the list is smaller
    randomRecipes = allRecipes.take(10).toList();
    notifyListeners();
  }
}

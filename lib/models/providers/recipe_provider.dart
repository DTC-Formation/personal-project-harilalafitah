import 'package:flutter/foundation.dart';
import 'package:recipes_app/database/db_helper.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeProvider() {
    getRecipes();
  }

  List<RecipeInfo> recipeInfo = [];
  List<RecipeInfo> favoriteRecipes = [];

  getRecipes() async {
    recipeInfo = await DbHelper.dbHelper.getAllRecipes();
    favoriteRecipes = recipeInfo.where((e) => e.isLiked).toList();
    notifyListeners();
  }

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

  deleteRecipe(RecipeInfo recipeInfo) {
    DbHelper.dbHelper.deleteRecipe(recipeInfo);
    getRecipes();
  }
}

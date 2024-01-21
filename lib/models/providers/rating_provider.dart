import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

class RatingProvider extends ChangeNotifier {
  final List<RecipeInfo> _recipeInfos;

  RatingProvider(List<RecipeInfo> recipeInfos) : _recipeInfos = recipeInfos;
  List<RecipeInfo> get recipeInfos => _recipeInfos;

  void updateRating(RecipeInfo recipeInfo, double rating) {
    recipeInfo.rating = rating;
    notifyListeners();
  }

  double getRecipeRating(RecipeInfo recipeInfo) {
    return recipeInfo.rating;
  }
}

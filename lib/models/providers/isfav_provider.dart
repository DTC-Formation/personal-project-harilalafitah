import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

// // For the recipes from API
class IsFavProvider with ChangeNotifier {
  final List<RecipeInfo> _recipeInfos;

  // Constructor that takes the initial list of recipeInfos
  IsFavProvider(List<RecipeInfo> recipeInfos) : _recipeInfos = recipeInfos;

  List<RecipeInfo> get recipeInfos => _recipeInfos;

  bool isRecipeLiked(RecipeInfo recipeInfo) {
    final int index = _recipeInfos.indexOf(recipeInfo);
    return index != -1 ? _recipeInfos[index].isLiked : false;
  }

  void toggleIsLiked(RecipeInfo recipeInfo) {
    final int index = _recipeInfos.indexOf(recipeInfo);
    if (index != -1) {
      _recipeInfos[index].toggleLiked();

      if (_recipeInfos[index].isLiked) {
        // If liked, add to favorites
        addToFavorites(_recipeInfos[index]);
      } else {
        // If unliked, remove from favorites
        removeFromFavorites(_recipeInfos[index]);
      }

      notifyListeners();
    }
  }

  final List<RecipeInfo> _favoriteRecipes = [];

  List<RecipeInfo> get favoriteRecipes => _favoriteRecipes;

  void addToFavorites(RecipeInfo recipeInfo) {
    if (!_favoriteRecipes.contains(recipeInfo)) {
      _favoriteRecipes.add(recipeInfo);
      notifyListeners();
    }
  }

  void removeFromFavorites(RecipeInfo recipeInfo) {
    if (_favoriteRecipes.contains(recipeInfo)) {
      _favoriteRecipes.remove(recipeInfo);
      notifyListeners();
    }
  }
}

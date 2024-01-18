import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';
// import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

//For the recipes from API
// class IsFavProvider with ChangeNotifier {
//   final List<RecipeInfo> _recipeInfos;

//   // Constructor that takes the initial list of recipeInfos
//   IsFavProvider(List<RecipeInfo> recipeInfos) : _recipeInfos = recipeInfos;

//   List<RecipeInfo> get recipeInfos => _recipeInfos;

//   bool isRecipeLiked(RecipeInfo recipeInfo) {
//     final int index = _recipeInfos.indexOf(recipeInfo);
//     return index != -1 ? _recipeInfos[index].isLiked : false;
//   }

//   void toggleIsLiked(RecipeInfo recipeInfo) {
//     final int index = _recipeInfos.indexOf(recipeInfo);
//     if (index != -1) {
//       _recipeInfos[index].toggleLiked();

//       if (_recipeInfos[index].isLiked) {
//         // If liked, add to favorites
//         addToFavorites(_recipeInfos[index]);
//       } else {
//         // If unliked, remove from favorites
//         removeFromFavorites(_recipeInfos[index]);
//       }

//       notifyListeners();
//     }
//   }

//   final List<RecipeInfo> _favoriteRecipes = [];

//   List<RecipeInfo> get favoriteRecipes => _favoriteRecipes;

//   void addToFavorites(RecipeInfo recipeInfo) {
//     if (!_favoriteRecipes.contains(recipeInfo)) {
//       _favoriteRecipes.add(recipeInfo);
//       notifyListeners();
//     }
//   }

//   void removeFromFavorites(RecipeInfo recipeInfo) {
//     if (_favoriteRecipes.contains(recipeInfo)) {
//       _favoriteRecipes.remove(recipeInfo);
//       notifyListeners();
//     }
//   }
// }

// For the hardCoding recipes
class IsFavProvider with ChangeNotifier {
  final List<Food> _foods;

  // Constructor that takes the initial list of foods
  IsFavProvider(List<Food> foods) : _foods = foods;

  List<Food> get foods => _foods;

  bool isFoodLiked(Food food) {
    final int index = _foods.indexOf(food);
    return index != -1 ? _foods[index].isLiked : false;
  }

  void toggleIsLiked(Food food) {
    final int index = _foods.indexOf(food);
    if (index != -1) {
      _foods[index].toggleLiked();

      if (_foods[index].isLiked) {
        // If liked, add to favorites
        addToFavorites(_foods[index]);
      } else {
        // If unliked, remove from favorites
        removeFromFavorites(_foods[index]);
      }

      notifyListeners();
    }
  }

  final List<Food> _favoriteRecipes = [];

  List<Food> get favoriteRecipes => _favoriteRecipes;

  void addToFavorites(Food food) {
    if (!_favoriteRecipes.contains(food)) {
      _favoriteRecipes.add(food);
      notifyListeners();
    }
  }

  void removeFromFavorites(Food food) {
    if (_favoriteRecipes.contains(food)) {
      _favoriteRecipes.remove(food);
      notifyListeners();
    }
  }
}

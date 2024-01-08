import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';

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

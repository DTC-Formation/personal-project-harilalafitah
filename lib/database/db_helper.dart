import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/api/random_recipes_api.dart';
import 'package:recipes_app/models/api/recipe_ingredients_api.dart';
import 'package:recipes_app/models/api/recipe_instructions_api.dart';
import 'package:recipes_app/models/api/recipe_nutrients_api.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName = 'recipes';
  final String idColumn = 'id';
  final String recipeColumn = 'recipe';
  final String instructionsColumn = 'instructions';
  final String ingredientsColumn = 'ingredients';
  final String nutrientsColumn = 'nutrients';
  final String isLikedColumn = 'isLiked';
  final String ratingColumn = 'ratings';

  initDatabase() async {
    database = await connectToDatabase();
    print('Database initialise!');
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = '$directory/recipes.db';

    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $recipeColumn TEXT, $instructionsColumn TEXT, $ingredientsColumn TEXT, $nutrientsColumn TEXT, $isLikedColumn INTEGER, $ratingColumn TEXT)');
      print('DataBase OK');
    }, onUpgrade: (db, oldVersion, newVersion) {
      db.execute(
          'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $recipeColumn TEXT, $instructionsColumn TEXT, $ingredientsColumn TEXT, $nutrientsColumn TEXT, $isLikedColumn INTEGER, $ratingColumn TEXT)');
    }, onDowngrade: (db, oldVersion, newVersion) {
      db.delete(tableName);
    });
  }

//to read data
  // Future<List<RecipeInfo>> getAllRecipes() async {
  //   List<Map<String, dynamic>> tasks = await database.query(tableName);
  //   return tasks.map((e) => RecipeInfo.fromMap(e)).toList();
  // }

  // Get all the recipes of the database
  Future<List<RecipeInfo>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) {
      return RecipeInfo(
        id: e[idColumn],
        recipe: RecipeFromApi.fromMap(json.decode(e[recipeColumn])),
        instructions: (json.decode(e[instructionsColumn]) as List<dynamic>)
            .map((instruction) => AnalyzedInstructions.fromMap(instruction))
            .toList(),
        ingredients: (json.decode(e[ingredientsColumn]) as List<dynamic>)
            .map((ingredient) => Ingredient.fromMap(ingredient))
            .toList(),
        nutrients: (json.decode(e[nutrientsColumn]) as List<dynamic>)
            .map((nutrient) => Nutrient.fromMap(nutrient))
            .toList(),
        isLiked: e[isLikedColumn] == 0,
        rating: e[ratingColumn] != null ? double.parse(e[ratingColumn]) : 0.0,
      );
    }).toList();
  }

  //to insert a list of RecipeInfo objects
  Future<void> insertNewRecipes(List<RecipeInfo> recipeInfos) async {
    Batch batch = database.batch();

    for (var recipeInfo in recipeInfos) {
      // print(recipeInfos);
      batch.insert(tableName, {
        recipeColumn: jsonEncode(recipeInfo.recipe.toMap()),
        instructionsColumn:
            jsonEncode(recipeInfo.instructions.map((i) => i.toMap()).toList()),
        ingredientsColumn:
            jsonEncode(recipeInfo.ingredients.map((i) => i.toMap()).toList()),
        nutrientsColumn:
            jsonEncode(recipeInfo.nutrients.map((n) => n.toMap()).toList()),
        isLikedColumn: recipeInfo.isLiked ? 1 : 0,
        ratingColumn: recipeInfo.rating,
      });
    }

    await batch.commit();
  }

//to insert a new recipe
  void insertNewRecipe(RecipeInfo recipeInfo) {
    database.insert(
      tableName,
      {
        recipeColumn: jsonEncode(recipeInfo.recipe.toMap()),
        instructionsColumn:
            jsonEncode(recipeInfo.instructions.map((i) => i.toMap()).toList()),
        ingredientsColumn:
            jsonEncode(recipeInfo.ingredients.map((i) => i.toMap()).toList()),
        nutrientsColumn:
            jsonEncode(recipeInfo.nutrients.map((n) => n.toMap()).toList()),
        isLikedColumn: recipeInfo.isLiked ? 1 : 0,
        ratingColumn: recipeInfo.rating,
      },
    );
  }

//to delete one column from table
  deleteRecipe(RecipeInfo recipeInfo) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [recipeInfo.id]);
  }

//to delete all of table
  deleteRecipes() {
    database.delete(tableName);
  }

// Update a recipe in the database
  updateRecipe(RecipeInfo recipeInfo) async {
    await database.update(
      tableName,
      {
        recipeColumn: jsonEncode(recipeInfo.recipe.toMap()),
        instructionsColumn:
            jsonEncode(recipeInfo.instructions.map((i) => i.toMap()).toList()),
        ingredientsColumn:
            jsonEncode(recipeInfo.ingredients.map((i) => i.toMap()).toList()),
        nutrientsColumn:
            jsonEncode(recipeInfo.nutrients.map((n) => n.toMap()).toList()),
        isLikedColumn: recipeInfo.isLiked ? 1 : 0,
      },
      where: '$idColumn=?',
      whereArgs: [recipeInfo.id],
    );
  }

  // Update the isLiked statue for a recipe
  updateIsLiked(RecipeInfo recipeInfo) {
    database.update(
      tableName,
      {isLikedColumn: !recipeInfo.isLiked ? 1 : 0},
      where: '$idColumn=?',
      whereArgs: [recipeInfo.id],
    );
  }

  // Update the rating for a specific recipe
  updateRating(RecipeInfo recipeInfo, double newRating) async {
    await database.update(
      tableName,
      {ratingColumn: newRating.toString()},
      where: '$idColumn=?',
      whereArgs: [recipeInfo.id],
    );
  }

  // Print the recipes of the database in the console
  // printDatabaseContent() async {
  //   List<RecipeInfo?> recipes = await DbHelper.dbHelper.getAllRecipes();
  //   print(recipes.length);
  //   Afficher le contenu
  //   recipes.forEach((recipe) {
  //     if (recipe != null) {
  //       print('Recipe ID: ${recipe.id}');
  //       print('Recipe Name: ${recipe.recipe.title}');
  //       print('Recipe totalTime: ${recipe.recipe.totalTime}');
  //       print('Recipe servings: ${recipe.recipe.serves}');
  //       print('Instructions: ${recipe.instructions}');
  //       print('Ingredients: ${recipe.ingredients}');
  //       print('Nutrients: ${recipe.nutrients}');
  //       print('Is Liked: ${recipe.isLiked}');
  //       print('Rating: ${recipe.rating}');
  //       print('-------------------------');
  //     }
  //   });
  // }
}

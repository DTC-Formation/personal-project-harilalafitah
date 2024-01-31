import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/recipe_provider.dart';
import 'package:recipes_app/screens/choosed_recipe/recipe_screen.dart';
import 'package:recipes_app/screens/recipe_list/food_list_screen.dart';

// Random recipes list for the home screen
class RecipeListHome extends StatefulWidget {
  final String selectedCategory;
  const RecipeListHome({super.key, required this.selectedCategory});

  @override
  State<RecipeListHome> createState() => _RecipeListHomeListState();
}

class _RecipeListHomeListState extends State<RecipeListHome> {
  @override
  Widget build(BuildContext context) {
    List<RecipeInfo> recipeInfos =
        context.watch<RecipeProvider>().randomRecipes;

    // List<Food> filteredFoods = foods;

    // if (widget.selectedCategory != "All") {
    //   filteredFoods = foods
    //       .where((food) => food.categories.contains(widget.selectedCategory))
    //       .toList();
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              // widget.selectedCategory,
              'All',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text button that take to the available recipes list
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FoodListScreen(selectedCategory: widget.selectedCategory),
                ),
              ),
              child: const Text("View all"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              min(10, recipeInfos.length),
              (index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecipesScreen(food: recipeInfos[index]),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 200,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              // The recipe image
                              image: DecorationImage(
                                image: NetworkImage(
                                    recipeInfos[index].recipe.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // The recipe title
                          Text(
                            recipeInfos[index].recipe.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // The nutrient
                              Row(
                                children: [
                                  const Icon(
                                    Iconsax.flash_1,
                                    size: 18,
                                    color: Colors.lightBlue,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${recipeInfos[index].nutrients[0].amount} ${recipeInfos[index].nutrients[0].unit}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              const SizedBox(width: 5),
                              // the cooking time
                              Row(
                                children: [
                                  const Icon(
                                    Iconsax.clock,
                                    size: 18,
                                    color: Colors.lightBlue,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${recipeInfos[index].recipe.totalTime} Mins",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Favorite button
                      Positioned(
                        top: 1,
                        right: 1,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              recipeInfos[index].toggleLiked();
                              context
                                  .read<RecipeProvider>()
                                  .updateIsLiked(recipeInfos[index]);
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(150, 255, 255, 255),
                            fixedSize: const Size(30, 30),
                          ),
                          iconSize: 20,
                          icon: Icon(
                              recipeInfos[index].isLiked
                                  ? Iconsax.heart5
                                  : Iconsax.heart,
                              color: Colors.red),
                        ),
                      ),
                      // Delete button
                      Positioned(
                        top: 1,
                        left: 1,
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                context
                                    .read<RecipeProvider>()
                                    .deleteRecipe(recipeInfos[index]);
                              },
                            );
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size(30, 30),
                          ),
                          iconSize: 20,
                          icon: const Icon(
                            Icons.delete_outline,
                            size: 25,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

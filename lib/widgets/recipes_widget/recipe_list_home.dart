import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/screens/choosed_recipe/recipe_screen.dart';
import 'package:recipes_app/screens/recipe_list/food_list_screen.dart';

class RecipeListHome extends StatefulWidget {
  final String selectedCategory;
  const RecipeListHome({super.key, required this.selectedCategory});

  @override
  State<RecipeListHome> createState() => _RecipeListHomeListState();
}

class _RecipeListHomeListState extends State<RecipeListHome> {
  @override
  Widget build(BuildContext context) {
    List<RecipeInfo> recipeInfos = GetRecipeData.recipeInfos;

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
            Text(
              // widget.selectedCategory,
              'All',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FoodListScreen(selectedCategory: widget.selectedCategory),
                ),
              ),
              child: Text("View all"),
            ),
          ],
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              recipeInfos.length,
              (index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RecipesScreen(food: recipeInfos[index]),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
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
                              image: DecorationImage(
                                image: NetworkImage(
                                    recipeInfos[index].recipe.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            recipeInfos[index].recipe.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.flash_1,
                                    size: 18,
                                    color: Colors.lightBlue,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "${recipeInfos[index].nutrients[0].amount} ${recipeInfos[index].nutrients[0].unit}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              SizedBox(width: 5),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.clock,
                                    size: 18,
                                    color: Colors.lightBlue,
                                  ),
                                  SizedBox(width: 5),
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
                      Positioned(
                        top: 1,
                        right: 1,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              context
                                  .read<IsFavProvider>()
                                  .toggleIsLiked(recipeInfos[index]);
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Color.fromARGB(150, 255, 255, 255),
                            fixedSize: Size(30, 30),
                          ),
                          iconSize: 20,
                          icon: Icon(
                            context
                                    .watch<IsFavProvider>()
                                    .isRecipeLiked(recipeInfos[index])
                                ? Iconsax.heart5
                                : Iconsax.heart,
                            color: context
                                    .watch<IsFavProvider>()
                                    .isRecipeLiked(recipeInfos[index])
                                ? Colors.red
                                : Colors.black,
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

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/recipe_provider.dart';
import 'package:recipes_app/screens/choosed_recipe/recipe_screen.dart';

class FoodCard extends StatefulWidget {
  final RecipeInfo food;
  const FoodCard({super.key, required this.food});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipesScreen(food: widget.food),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(widget.food.recipe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.food.recipe.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
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
                          "${widget.food.nutrients[0].amount} Kcal",
                          style: TextStyle(
                            fontSize: 10,
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
                          "${widget.food.recipe.totalTime} Min",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.star5,
                      color: Colors.yellow.shade700,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${widget.food.rating}/5",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: 1,
              right: 1,
              child: IconButton(
                onPressed: () {
                  setState(
                    () {
                      widget.food.toggleLiked();
                      context.read<RecipeProvider>().updateIsLiked(widget.food);
                    },
                  );
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(30, 30),
                ),
                iconSize: 20,
                icon: widget.food.isLiked
                    ? Icon(Iconsax.heart5, color: Colors.red)
                    : Icon(
                        Iconsax.heart,
                        color: Colors.red,
                      ),
              ),
            ),
            Positioned(
              top: 1,
              left: 1,
              child: IconButton(
                onPressed: () {
                  setState(
                    () {
                      context.read<RecipeProvider>().deleteRecipe(widget.food);
                    },
                  );
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(30, 30),
                ),
                iconSize: 20,
                icon: Icon(
                  Icons.delete_outline,
                  size: 25,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

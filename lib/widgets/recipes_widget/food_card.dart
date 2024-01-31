import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/recipe_provider.dart';
import 'package:recipes_app/screens/choosed_recipe/recipe_screen.dart';

// A food card model to display the recipe in a list
class FoodCard extends StatefulWidget {
  final RecipeInfo food;
  const FoodCard({super.key, required this.food});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    // Take to the recipe screen details
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
                    // The recipe image
                    image: DecorationImage(
                      image: NetworkImage(widget.food.recipe.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // The recipe title
                Text(
                  widget.food.recipe.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    // The recipe nutrient
                    Row(
                      children: [
                        const Icon(
                          Iconsax.flash_1,
                          size: 18,
                          color: Colors.lightBlue,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${widget.food.nutrients[0].amount} Kcal",
                          style: TextStyle(
                            fontSize: 10,
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
                    // The recipe cooking time
                    Row(
                      children: [
                        const Icon(
                          Iconsax.clock,
                          size: 18,
                          color: Colors.lightBlue,
                        ),
                        const SizedBox(width: 5),
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
                // The widget rating
                Row(
                  children: [
                    Icon(
                      Iconsax.star5,
                      color: Colors.yellow.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${widget.food.rating}/5",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
            // Favorite button
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
                  fixedSize: const Size(30, 30),
                ),
                iconSize: 20,
                icon: widget.food.isLiked
                    ? const Icon(Iconsax.heart5, color: Colors.red)
                    : const Icon(
                        Iconsax.heart,
                        color: Colors.red,
                      ),
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
                      context.read<RecipeProvider>().deleteRecipe(widget.food);
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
    );
  }
}

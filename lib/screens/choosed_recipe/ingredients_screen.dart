import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

// The ingredients list for the cooking screen
class IngredientsScreen extends StatefulWidget {
  final RecipeInfo food;
  const IngredientsScreen({super.key, required this.food});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      itemCount: widget.food.ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = widget.food.ingredients[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 215,
                  // Ingredient name
                  child: Text(
                    ingredient.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                // Ingredient value and unit
                Text(
                  '${ingredient.metric.value} ${ingredient.metric.unit}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

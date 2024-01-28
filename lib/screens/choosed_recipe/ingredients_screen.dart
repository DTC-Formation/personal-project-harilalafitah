import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

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
      padding: EdgeInsets.all(20),
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
                Container(
                  width: 215,
                  child: Text(
                    '${ingredient.name}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  '${ingredient.metric.value} ${ingredient.metric.unit}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';

class IngredientsScreen extends StatefulWidget {
  final Food food;
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
      itemBuilder: (context, index) => Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Text(
            widget.food.ingredients[index],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

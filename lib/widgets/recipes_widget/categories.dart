import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/categories_model.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.currentCat,
  });

  final String currentCat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Container(
            decoration: BoxDecoration(
              color: currentCat == categories[index]
                  ? Colors.lightBlue
                  : Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            margin: EdgeInsets.only(right: 20),
            child: Text(
              categories[index],
              style: TextStyle(
                color: currentCat == categories[index]
                    ? Colors.white
                    : Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

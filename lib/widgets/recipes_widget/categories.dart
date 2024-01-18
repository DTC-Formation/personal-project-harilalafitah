import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/categories_model.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.currentCat,
    required this.onCategorySelected,
  });

  final String currentCat;
  final Function(String) onCategorySelected;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => GestureDetector(
            onTap: () {
              widget.onCategorySelected(categories[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                color: widget.currentCat == categories[index]
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
                  color: widget.currentCat == categories[index]
                      ? Colors.white
                      : Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

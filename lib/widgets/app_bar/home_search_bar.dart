import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

class HomeSearchBar extends StatefulWidget {
  final Function(String) onSearch;
  const HomeSearchBar({
    super.key,
    required this.onSearch,
  });

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  List<RecipeInfo> displayList = List.from(GetRecipeData.recipeInfos);
  void updateList(value) {
    setState(() {
      displayList = GetRecipeData.recipeInfos
          .where((element) =>
              element.recipe.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    widget.onSearch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(
        children: [
          Icon(
            Iconsax.search_normal,
            color: Colors.lightBlue,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search any recipes',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/recipe_provider.dart';
import 'package:recipes_app/widgets/app_bar/home_search_bar.dart';
import 'package:recipes_app/widgets/recipes_widget/food_card.dart';

// Search screen
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // A list for every recipes in the DB
  late List<RecipeInfo> allFoods;
  List<RecipeInfo> displayedFoods = [];

  @override
  void initState() {
    super.initState();
    allFoods = context.read<RecipeProvider>().recipeInfo;
    displayedFoods = List.from(allFoods);
  }

  // Update the list with the appropriate recipes based on the search
  void updateList(String value) {
    setState(() {
      displayedFoods.clear();
      displayedFoods = allFoods
          .where((element) =>
              element.recipe.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          // App bar, Home search bar widget
          child: HomeSearchBar(onSearch: updateList),
        ),
        toolbarHeight: 75.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 225,
                  ),
                  itemBuilder: (context, index) => FoodCard(
                    food: displayedFoods[index],
                  ),
                  itemCount: displayedFoods.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

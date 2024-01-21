import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/widgets/app_bar/home_search_bar.dart';
import 'package:recipes_app/widgets/recipes_widget/food_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<RecipeInfo> allFoods = GetRecipeData.recipeInfos;
  List<RecipeInfo> displayedFoods = [];

  @override
  void initState() {
    super.initState();
    displayedFoods.addAll(allFoods);
  }

  void updateList(String value) {
    setState(() {
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
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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

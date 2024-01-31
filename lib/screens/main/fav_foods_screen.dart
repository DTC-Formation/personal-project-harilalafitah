import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/categories_model.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/recipe_provider.dart';
import 'package:recipes_app/screens/recipe_list/food_list_screen.dart';
import 'package:recipes_app/widgets/app_bar/appbar_customable.dart';
import 'package:recipes_app/widgets/app_bar/notif_dialog.dart';
import 'package:recipes_app/widgets/recipes_widget/food_card.dart';

// The favorite recipes screen
class FavoriteFoodScreen extends StatefulWidget {
  const FavoriteFoodScreen({
    super.key,
  });

  @override
  State<FavoriteFoodScreen> createState() => _FavoriteFoodScreenState();
}

class _FavoriteFoodScreenState extends State<FavoriteFoodScreen> {
  String currentCat = categories[0];

  @override
  Widget build(BuildContext context) {
    List<RecipeInfo> favoriteRecipes =
        context.watch<RecipeProvider>().favoriteRecipes;
    List<RecipeInfo> filteredFoods = favoriteRecipes;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          // App bar widget
          child: AppBarCustom(
            titre: "Favorites",
            // Button 1
            icon1: const Icon(
              Iconsax.menu_board,
              color: Colors.lightBlue,
            ),
            onPressed1: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodListScreen(
                    selectedCategory: currentCat,
                  ),
                ),
              );
            },
            // Button 2
            icon2: Icon(
              Iconsax.notification,
              color: Colors.yellow.shade800,
            ),
            onPressed2: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const NotifDialog();
                  });
            },
          ),
        ),
        toolbarHeight: 75.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: favoriteRecipes.isEmpty
              // A text to display if there is no fav recipe yet
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: const Center(
                    child: Text("Add your favorite recipes"),
                  ),
                )
              // The manner to display the fav recipes
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 225,
                        ),
                        // Food card recipe to display the recipes
                        itemBuilder: (context, index) => FoodCard(
                          food: filteredFoods[index],
                        ),
                        itemCount: filteredFoods.length,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

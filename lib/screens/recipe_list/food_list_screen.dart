import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/widgets/app_bar/appbar_customable.dart';
import 'package:recipes_app/widgets/app_bar/notif_dialog.dart';
import 'package:recipes_app/widgets/recipes_widget/food_card.dart';

class FoodListScreen extends StatefulWidget {
  final String selectedCategory;
  const FoodListScreen({super.key, required this.selectedCategory});

  @override
  State<FoodListScreen> createState() => _QuickFoodState();
}

class _QuickFoodState extends State<FoodListScreen> {
  @override
  Widget build(BuildContext context) {
    List<RecipeInfo> filteredFoods = GetRecipeData.recipeInfos;

    // if (widget.selectedCategory != "All") {
    //   filteredFoods = foods
    //       .where((food) => food.categories.contains(widget.selectedCategory))
    //       .toList();
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: AppBarCustom(
            titre: "Available recipes",
            icon1: Icon(
              CupertinoIcons.chevron_back,
              color: Colors.blueAccent,
            ),
            onPressed1: () {
              Navigator.pop(context);
            },
            icon2: Icon(
              Iconsax.notification,
              color: Colors.yellow.shade800,
            ),
            onPressed2: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return NotifDialog();
                  });
            },
          ),
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
                    food: filteredFoods[index],
                  ),
                  itemCount: filteredFoods.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

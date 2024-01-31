import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/screens/choosed_recipe/ingredients_screen.dart';
import 'package:recipes_app/screens/choosed_recipe/instructions_screen.dart';
import 'package:recipes_app/widgets/app_bar/appbar_customable.dart';

// The cooking screen
class CookingPage extends StatefulWidget {
  final RecipeInfo food;
  const CookingPage({super.key, required this.food});

  @override
  State<CookingPage> createState() => _CookingPageState();
}

class _CookingPageState extends State<CookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            // AppBar widget
            child: AppBarCustom(
              titre: "Cooking time!",
              // Button 1
              icon1: const Icon(
                CupertinoIcons.chevron_back,
                color: Colors.blueAccent,
              ),
              onPressed1: () {
                Navigator.pop(context);
              },
              // Button 2
              icon2: const Icon(
                Icons.restaurant_menu,
                size: 25,
                color: Colors.lightBlue,
              ),
              onPressed2: () {},
            ),
          ),
          toolbarHeight: 75.0,
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Instructions',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IngredientsScreen(food: widget.food),
            Instructions(food: widget.food),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/screens/choosed_recipe/ingredients_screen.dart';
import 'package:recipes_app/screens/choosed_recipe/instructions_screen.dart';
import 'package:recipes_app/widgets/app_bar/appbar_customable.dart';

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
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: AppBarCustom(
              titre: "Cooking time!",
              icon1: Icon(
                CupertinoIcons.chevron_back,
                color: Colors.blueAccent,
              ),
              onPressed1: () {
                Navigator.pop(context);
              },
              icon2: Icon(
                Icons.restaurant_menu,
                size: 25,
                color: Colors.lightBlue,
              ),
              onPressed2: () {},
            ),
          ),
          toolbarHeight: 75.0,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
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

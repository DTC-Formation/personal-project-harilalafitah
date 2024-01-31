import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/categories_model.dart';
import 'package:recipes_app/widgets/app_bar/home_app_bar.dart';
import 'package:recipes_app/widgets/recipes_widget/categories.dart';
import 'package:recipes_app/widgets/recipes_widget/recipe_list_home.dart';

// The home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentCat = categories[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              // App bar
              child: HomeAppBar(),
            ),
            const SizedBox(height: 40.0),
            // Plache holder image
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/placeholder.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Categories text
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            // The categories button
            Categories(
              currentCat: currentCat,
              onCategorySelected: (selectedCategory) {
                setState(() {
                  currentCat = selectedCategory;
                });
              },
            ),
            const SizedBox(height: 20.0),
            // A recipe list for the home screen
            RecipeListHome(selectedCategory: currentCat),
          ],
        ),
      ),
    );
  }
}

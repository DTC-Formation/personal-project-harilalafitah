import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/categories_model.dart';
import 'package:recipes_app/widgets/app_bar/home_app_bar.dart';
import 'package:recipes_app/widgets/app_bar/home_search_bar.dart';
import 'package:recipes_app/widgets/recipes_widget/categories.dart';
import 'package:recipes_app/widgets/recipes_widget/recipe_list_home.dart';

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
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(),
            SizedBox(height: 20.0),
            HomeSearchBar(),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/placeholder.jpg'),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Categories(
              currentCat: currentCat,
              onCategorySelected: (selectedCategory) {
                setState(() {
                  currentCat = selectedCategory;
                });
              },
            ),
            SizedBox(height: 20.0),
            RecipeListHome(selectedCategory: currentCat),
          ],
        ),
      ),
    );
  }
}

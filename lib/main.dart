import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/models/providers/rating_provider.dart';
import 'package:recipes_app/screens/main/main_screen.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

void main() async {
  await GetRecipeData.fetchDataAndBuildRecipeInfos();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IsFavProvider(GetRecipeData.recipeInfos),
        ),
        ChangeNotifierProvider(
          create: (_) => RatingProvider(GetRecipeData.recipeInfos),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipes sharing',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          scaffoldBackgroundColor: Colors.grey.shade200,
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        home: MainScreen(),
      ),
    );
  }
}

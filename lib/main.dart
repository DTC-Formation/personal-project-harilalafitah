import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/food.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => IsFavProvider(foods),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipes sharing',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          scaffoldBackgroundColor: Colors.grey.shade200,
          useMaterial3: true,
        ),
        home: MainScreen(),
      ),
    );
  }
}

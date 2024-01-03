import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/screens/quick_food_screen.dart';
import 'package:recipes_app/widgets/food_card.dart';
import 'package:recipes_app/widgets/notif_dialog.dart';

class FavoriteFoodScreen extends StatefulWidget {
  const FavoriteFoodScreen({super.key});

  @override
  State<FavoriteFoodScreen> createState() => _FavoriteFoodScreenState();
}

class _FavoriteFoodScreenState extends State<FavoriteFoodScreen> {
  @override
  Widget build(BuildContext context) {
    final isFavProvider = context.watch<IsFavProvider>();
    final favoriteRecipes = isFavProvider.favoriteRecipes;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuickFoodScreen(),
                  ),
                );
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(55.0, 55.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(15),
                ),
              ),
              color: Colors.black,
              icon: Icon(Iconsax.menu_board),
            ),
            Spacer(),
            Text(
              "Favorite Recipes",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NotifDialog();
                    });
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(55.0, 55.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(15),
                ),
              ),
              color: Colors.black,
              icon: Icon(Iconsax.notification),
            ),
          ],
        ),
        toolbarHeight: 75.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 225,
                ),
                itemBuilder: (context, index) => FoodCard(
                  food: favoriteRecipes[index],
                ),
                itemCount: favoriteRecipes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

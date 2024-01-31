import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/recipe_provider.dart';
import 'package:recipes_app/screens/choosed_recipe/cooking_screen.dart';
import 'package:recipes_app/widgets/app_bar/notif_dialog.dart';
import 'package:recipes_app/widgets/rating_widget/rating_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// Display a specific recipe infos
class RecipesScreen extends StatefulWidget {
  final RecipeInfo food;

  const RecipesScreen({
    super.key,
    required this.food,
  });

  @override
  State<RecipesScreen> createState() => _RecipesDetailsState();
}

class _RecipesDetailsState extends State<RecipesScreen> {
  late double currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.food.rating;
  }

  void updateRating(double rating) {
    setState(() {
      currentRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // Bottom navBar
      bottomNavigationBar: Container(
        color: Colors.grey.shade800,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Start cooking button
            Expanded(
              flex: 6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade300,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CookingPage(food: widget.food),
                    ),
                  );
                },
                child: const Text("Start cooking"),
              ),
            ),
            const SizedBox(width: 10),
            // Favorite button
            Expanded(
              child: IconButton(
                style: IconButton.styleFrom(
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    widget.food.toggleLiked();
                    context.read<RecipeProvider>().updateIsLiked(widget.food);
                  });
                },
                icon: Icon(
                  widget.food.isLiked ? Iconsax.heart5 : Iconsax.heart,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      // Sliding Panel
      body: SlidingUpPanel(
        color: Colors.grey.shade200,
        isDraggable: true,
        parallaxEnabled: true,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        minHeight: size.height / 2.5,
        maxHeight: size.height / 2.0,
        panel: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Little deco on top of the sliding panel
              Center(
                child: Container(
                  height: 5.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 35.0),
              Center(
                // Recipe title
                child: Text(
                  widget.food.recipe.title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Display the nutrient
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 75),
                            backgroundColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Column(
                              children: <Widget>[
                                const Icon(
                                  Iconsax.flash_1,
                                  color: Colors.yellowAccent,
                                  size: 38.0,
                                ),
                                const SizedBox(height: 3.0),
                                Text(
                                  '${widget.food.nutrients[0].amount} kcal',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        // Display the Servings
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 75),
                            backgroundColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Column(
                              children: <Widget>[
                                const Icon(
                                  Icons.restaurant_menu,
                                  color: Colors.lightBlue,
                                  size: 38.0,
                                ),
                                const SizedBox(height: 3.0),
                                Text(
                                  '${widget.food.recipe.serves} servings',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Display the cooking time
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 75),
                            backgroundColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Column(
                              children: <Widget>[
                                const Icon(
                                  Iconsax.clock,
                                  color: Colors.lightBlue,
                                  size: 38.0,
                                ),
                                const SizedBox(height: 3.0),
                                Text(
                                  '${widget.food.recipe.totalTime} mins',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Display the number of stars (Rating) of the recipe
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 75),
                            backgroundColor: Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Column(
                              children: <Widget>[
                                const Icon(
                                  Iconsax.star5,
                                  color: Colors.amber,
                                  size: 38.0,
                                ),
                                const SizedBox(height: 3.0),
                                Text(
                                  '$currentRating/5 stars',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Rating Bar
              RatingBarWidget(
                recipeInfo: widget.food,
                onRatingChanged: (double rating) {
                  updateRating(rating);
                },
              ),
              const SizedBox(height: 5.0),
              const Center(
                child: Text(
                  '(Would You rate the recipe?)',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // The image of the recipe(In background)
                  Hero(
                    tag: widget.food.recipe.image,
                    child: ClipRRect(
                      child: Image(
                        width: double.infinity,
                        height: (size.height / 2) + 50,
                        image: NetworkImage(widget.food.recipe.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              // Back button
              Positioned(
                top: 40,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.blueAccent,
                        size: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
              // Notif button
              Positioned(
                top: 40,
                right: 20,
                child: InkWell(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return const NotifDialog();
                      }),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Iconsax.notification,
                      color: Colors.yellow.shade800,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

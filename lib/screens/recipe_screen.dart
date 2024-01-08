import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/screens/choosed_recipe/instructions_screen.dart';
import 'package:recipes_app/screens/ingredients_screen.dart';
import 'package:recipes_app/widgets/app_bar/notif_dialog.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipesScreen extends StatefulWidget {
  final Food food;

  const RecipesScreen({
    super.key,
    required this.food,
  });

  @override
  State<RecipesScreen> createState() => _RecipesDetailsState();
}

class _RecipesDetailsState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.grey.shade800,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
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
                      builder: (context) => Instructions(food: widget.food),
                    ),
                  );
                },
                child: Text("Start cooking"),
              ),
            ),
            SizedBox(width: 10),
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
                    context.read<IsFavProvider>().toggleIsLiked(widget.food);
                  });
                },
                icon: Icon(
                  context.watch<IsFavProvider>().isFoodLiked(widget.food)
                      ? Iconsax.heart5
                      : Iconsax.heart,
                  size: 20,
                  color: widget.food.isLiked ? Colors.red : Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SlidingUpPanel(
        color: Colors.grey.shade200,
        isDraggable: true,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        minHeight: size.height / 2.5,
        maxHeight: size.height / 2,
        panel: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 35.0),
              Center(
                child: Text(
                  widget.food.name,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.blue.shade800,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Description:\n  ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: widget.food.description,
                            style: TextStyle(
                              fontSize: 17.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Iconsax.star5,
                          color: Colors.yellow.shade700,
                          size: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${widget.food.rate}/5",
                          style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: 17.5,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "(${widget.food.reviews} Reviews)",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.flash_1,
                              size: 20,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.food.kcal} Kcal/serving",
                              style: TextStyle(
                                fontSize: 17.5,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Iconsax.clock,
                              size: 20,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${widget.food.totalTime} Mins",
                              style: TextStyle(
                                fontSize: 17.5,
                                color: Colors.blue.shade800,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "(prep: ${widget.food.prepTime} Mins | cook: ${widget.food.cookTime} Mins)",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(300, 50)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => IngredientsScreen(
                                  food: widget.food,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.menu_board,
                                size: 25,
                                color: Colors.lightBlue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Ingredients",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "(for ${widget.food.serves} servings)",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
                  Hero(
                    tag: widget.food.image,
                    child: ClipRRect(
                      child: Image(
                        width: double.infinity,
                        height: (size.height / 2) + 50,
                        image: AssetImage(widget.food.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
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
              Positioned(
                top: 40,
                right: 20,
                child: InkWell(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return NotifDialog();
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

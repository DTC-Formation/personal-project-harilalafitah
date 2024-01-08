import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/screens/recipe_list/quick_food_screen.dart';
import 'package:recipes_app/screens/recipe_screen.dart';

class QuickAndFastList extends StatefulWidget {
  const QuickAndFastList({super.key});

  @override
  State<QuickAndFastList> createState() => _QuickAndFastListState();
}

class _QuickAndFastListState extends State<QuickAndFastList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quick & Fast",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuickFoodScreen(),
                ),
              ),
              child: Text("View all"),
            ),
          ],
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              foods.length,
              // ((foods.length / 2).toInt()),
              (index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipesScreen(food: foods[index]),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 200,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(foods[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            foods[index].name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.flash_1,
                                    size: 18,
                                    color: Colors.lightBlue,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "${foods[index].kcal} Kcal/serv",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              SizedBox(width: 5),
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.clock,
                                    size: 18,
                                    color: Colors.lightBlue,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "${foods[index].totalTime} Mins",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 1,
                        right: 1,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              context
                                  .read<IsFavProvider>()
                                  .toggleIsLiked(foods[index]);
                            });
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Color.fromARGB(150, 255, 255, 255),
                            fixedSize: Size(30, 30),
                          ),
                          iconSize: 20,
                          icon: Icon(
                            context
                                    .watch<IsFavProvider>()
                                    .isFoodLiked(foods[index])
                                ? Iconsax.heart5
                                : Iconsax.heart,
                            color: context
                                    .watch<IsFavProvider>()
                                    .isFoodLiked(foods[index])
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

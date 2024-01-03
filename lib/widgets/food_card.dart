import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/food.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/screens/recipes_screen.dart';

class FoodCard extends StatefulWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeScreen(food: widget.food),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(widget.food.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.food.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
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
                          "${widget.food.kcal} Kcal/serv",
                          style: TextStyle(
                            fontSize: 10,
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
                          "${widget.food.totalTime} Min",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Iconsax.star5,
                      color: Colors.yellow.shade700,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${widget.food.rate}/5",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "(${widget.food.reviews} Reviews)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: 1,
              right: 1,
              child: IconButton(
                onPressed: () {
                  setState(
                    () {
                      context.read<IsFavProvider>().toggleIsLiked(widget.food);
                    },
                  );
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(30, 30),
                ),
                iconSize: 20,
                icon: context.watch<IsFavProvider>().isFoodLiked(widget.food)
                    ? Icon(Iconsax.heart5, color: Colors.red)
                    : Icon(
                        Iconsax.heart,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

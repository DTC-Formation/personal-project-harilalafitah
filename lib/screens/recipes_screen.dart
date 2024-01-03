import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/food.dart';
import 'package:recipes_app/models/providers/isfav_provider.dart';
import 'package:recipes_app/screens/instructions_screen.dart';
import 'package:recipes_app/widgets/notif_dialog.dart';

class RecipeScreen extends StatefulWidget {
  final Food food;
  const RecipeScreen({super.key, required this.food});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  // int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.food.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 10,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          fixedSize: Size(50.0, 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(15),
                          ),
                        ),
                        color: Colors.black,
                        icon: Icon(CupertinoIcons.chevron_back),
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
                          fixedSize: Size(50.0, 50.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(15),
                          ),
                        ),
                        color: Colors.black,
                        icon: Icon(Iconsax.notification),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
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
                            color: Colors.black87,
                            fontSize: 14.0,
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
                                fontSize: 14,
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
                                fontSize: 14,
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
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                                    fontWeight: FontWeight.bold,
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

                            // Text(
                            //   "How many servings?",
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     color: Colors.grey,
                            //   ),
                            // )
                          ],
                        ),
                        // Spacer(),
                        // FoodCounter(
                        //   currentNumber: currentNumber,
                        //   onAdd: () => setState(() {
                        //     currentNumber++;
                        //   }),
                        //   onRemoved: () {
                        //     if (currentNumber != 1) {
                        //       setState(() {
                        //         currentNumber--;
                        //       });
                        //     }
                        //   },
                        // ),
                      ],
                    ),
                    Container(
                      height: 350,
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        itemCount: widget.food.ingredients.length,
                        itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              widget.food.ingredients[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => Divider(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

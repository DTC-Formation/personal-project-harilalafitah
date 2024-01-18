import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';

class IngredientsDrawer extends StatefulWidget {
  final Food food;
  const IngredientsDrawer({
    super.key,
    required this.food,
  });

  @override
  State<IngredientsDrawer> createState() => _IngredientsDrawerState();
}

class _IngredientsDrawerState extends State<IngredientsDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.grey.shade300,
        width: MediaQuery.of(context).size.width - 75,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restaurant_menu,
                    color: Colors.lightBlue,
                    size: 50,
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        "Ingredients",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue),
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
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 800,
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 20),
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
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';
import 'package:recipes_app/screens/choosed_recipe/instructions_screen.dart';
import 'package:recipes_app/widgets/app_bar/appbar_customable.dart';

class IngredientsScreen extends StatefulWidget {
  final Food food;
  const IngredientsScreen({super.key, required this.food});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: AppBarCustom(
            titre: "Ingredients",
            icon1: Icon(
              CupertinoIcons.chevron_back,
              color: Colors.blueAccent,
            ),
            onPressed1: () {
              Navigator.pop(context);
            },
            icon2: Icon(
              Iconsax.menu_board,
              size: 25,
              color: Colors.lightBlue,
            ),
            onPressed2: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Instructions(food: widget.food),
                  ));
            },
          ),
        ),
        toolbarHeight: 75.0,
      ),
      body: ListView.separated(
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
    );
  }
}

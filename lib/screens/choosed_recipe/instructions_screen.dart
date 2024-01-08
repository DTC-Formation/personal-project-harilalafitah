import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';
import 'package:recipes_app/screens/ingredients_screen.dart';
import 'package:recipes_app/widgets/app_bar/appbar_customable.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key, required this.food});

  final Food food;

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: AppBarCustom(
            titre: "Instructions",
            icon1: Icon(
              CupertinoIcons.chevron_back,
              color: Colors.blueAccent,
            ),
            onPressed1: () {
              Navigator.pop(context);
            },
            icon2: Icon(
              Icons.shopping_bag_outlined,
              size: 25,
              color: Colors.lightBlue,
            ),
            onPressed2: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => IngredientsScreen(
                    food: widget.food,
                  ),
                ),
              );
            },
          ),
        ),
        toolbarHeight: 75.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 5),
          child: Column(
            children: [
              ListView.builder(
                itemCount: widget.food.instructions.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var step = index + 1;
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(
                            step.toString(),
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                          VerticalDivider(
                            color: Colors.deepOrange,
                            thickness: 1.5,
                          ),
                          Flexible(
                            child: Text(
                              widget.food.instructions[index],
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

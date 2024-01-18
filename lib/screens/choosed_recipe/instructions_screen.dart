import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/food.dart';

class Instructions extends StatefulWidget {
  const Instructions({super.key, required this.food});

  final Food food;

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 10, top: 20, bottom: 20),
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
    );
  }
}

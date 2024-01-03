import 'package:flutter/material.dart';
import 'package:recipes_app/models/food.dart';
import 'package:recipes_app/widgets/appbar_customable.dart';

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
          child: AppBarCustom(titre: "Instructions"),
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

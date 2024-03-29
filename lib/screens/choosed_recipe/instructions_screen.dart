import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';

// Instructions lsit for the cooking screen
class Instructions extends StatefulWidget {
  const Instructions({Key? key, required this.food}) : super(key: key);

  final RecipeInfo food;

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var analyzedInstructions in widget.food.instructions)
              ...analyzedInstructions.steps.map(
                (instructionStep) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            // Step number
                            child: Text(
                              'Step ${instructionStep.number}:',
                              style: const TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.redAccent,
                                decorationThickness: 2.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Flexible(
                            //  Instruction
                            child: Text(
                              instructionStep.step,
                              style: const TextStyle(fontSize: 17.0),
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

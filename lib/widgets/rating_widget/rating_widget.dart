import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/rating_provider.dart';

class RatingBarWidget extends StatefulWidget {
  final RecipeInfo recipeInfo;

  const RatingBarWidget({Key? key, required this.recipeInfo}) : super(key: key);

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the RatingProvider
    RatingProvider ratingProvider = context.watch<RatingProvider>();

    return Center(
      child: RatingBar.builder(
        initialRating: widget.recipeInfo.rating,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemPadding: EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, index) => Icon(
          Iconsax.star1,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          ratingProvider.updateRating(widget.recipeInfo, rating);
        },
      ),
    );
  }
}

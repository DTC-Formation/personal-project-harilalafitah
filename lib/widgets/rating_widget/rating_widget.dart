import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/models/Recipe_model/recipe_from_api.dart';
import 'package:recipes_app/models/providers/recipe_provider.dart';

// Rating bar widget
class RatingBarWidget extends StatefulWidget {
  final RecipeInfo recipeInfo;
  final void Function(double rating) onRatingChanged;

  const RatingBarWidget(
      {Key? key, required this.recipeInfo, required this.onRatingChanged})
      : super(key: key);

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    RecipeProvider ratingProvider = context.watch<RecipeProvider>();

    return Center(
      child: RatingBar.builder(
        initialRating: widget.recipeInfo.rating,
        minRating: 0,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, index) => const Icon(
          Iconsax.star1,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          widget.onRatingChanged(rating);
          ratingProvider.updateRating(widget.recipeInfo, rating);
        },
      ),
    );
  }
}

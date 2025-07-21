import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomRatingStarItem.dart';

class CustomRatingStarsRow extends StatelessWidget {
  const CustomRatingStarsRow({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRatingStarItem(isFilled: rating >= 1 ? true : false),
        CustomRatingStarItem(isFilled: rating >= 2 ? true : false),
        CustomRatingStarItem(isFilled: rating >= 3 ? true : false),
        CustomRatingStarItem(isFilled: rating >= 4 ? true : false),
        CustomRatingStarItem(isFilled: rating >= 5 ? true : false),
      ],
    );
  }
}

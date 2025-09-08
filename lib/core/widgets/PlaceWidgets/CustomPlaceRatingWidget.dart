// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomRatingStarsRow.dart';

class CustomPlaceRatingWidget extends StatelessWidget {
  CustomPlaceRatingWidget({super.key, required this.rating, this.ratingColor});
  final double rating;
  Color? ratingColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRatingStarsRow(rating: rating),
        SizedBox(width: 5),
        Text(
          rating.toStringAsFixed(1),
          style: AppTextStyles(
            context,
          ).medium12.copyWith(color: ratingColor ?? Colors.black),
        ),
      ],
    );
  }
}

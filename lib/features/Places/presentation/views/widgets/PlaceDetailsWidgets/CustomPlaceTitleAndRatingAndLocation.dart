import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceLocationWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceRatingWidget.dart';

class CustomPlaceTitleAndRatingAndLocation extends StatelessWidget {
  const CustomPlaceTitleAndRatingAndLocation({super.key, required this.place});
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles(
                context,
              ).semiBold16.copyWith(color: Colors.black),
            ),
            SizedBox(height: 5),
            CustomPlaceLocationWidget(location: place.location),
          ],
        ),
        CustomPlaceRatingWidget(
          rating: place.rating,
          ratingColor: Colors.black,
        ),
      ],
    );
  }
}

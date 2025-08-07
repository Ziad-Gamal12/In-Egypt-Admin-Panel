import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomRatingStarsRow.dart';

class CustomPlaceHorizintalDesignInfo extends StatelessWidget {
  const CustomPlaceHorizintalDesignInfo({super.key, required this.place});
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          place.name,
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        SizedBox(height: 10),
        Text(
          "${place.ticketPrice.toString()} جنيه",
          style: AppTextStyles(context).semiBold14.copyWith(color: Colors.red),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRatingStarsRow(rating: place.rating),
            SizedBox(width: 5),
            Text(
              place.rating.toString(),
              style: AppTextStyles(
                context,
              ).semiBold12.copyWith(color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 5),
        Expanded(
          child: SizedBox(
            child: Text(
              place.description,
              style: AppTextStyles(
                context,
              ).regular13.copyWith(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

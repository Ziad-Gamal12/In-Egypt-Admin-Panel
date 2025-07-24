import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceRatingWidget.dart';

class CustomPlaceItemInfo extends StatelessWidget {
  CustomPlaceItemInfo({super.key, this.titleColor, required this.place});
  Color? titleColor;
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles(
                context,
              ).semiBold20.copyWith(color: titleColor ?? Colors.white),
            ),
            SizedBox(height: 10),
            CustomPlaceRatingWidget(rating: place.rating),
          ],
        ),
      ),
    );
  }
}

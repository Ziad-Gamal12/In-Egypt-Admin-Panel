import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceLocationWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceRatingWidget.dart';

class CustomPlaceItemInfo extends StatelessWidget {
  CustomPlaceItemInfo({super.key, this.titleColor, required this.place});
  Color? titleColor;
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
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
            ).semiBold16.copyWith(color: titleColor ?? Colors.black),
          ),
          SizedBox(height: 5),
          CustomPlaceLocationWidget(location: place.location),
          SizedBox(height: 5),
          CustomPlaceRatingWidget(rating: place.rating),
        ],
      ),
    );
  }
}

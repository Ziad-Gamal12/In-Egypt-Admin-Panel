import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceItemInfo.dart';

class CustomPlaceVerticalDesignItem extends StatefulWidget {
  const CustomPlaceVerticalDesignItem({super.key, required this.place});
  final PlaceEntity place;
  @override
  State<CustomPlaceVerticalDesignItem> createState() =>
      _CustomPlaceVerticalDesignItemState();
}

class _CustomPlaceVerticalDesignItemState
    extends State<CustomPlaceVerticalDesignItem> {
  @override
  Widget build(BuildContext context) {
    return CustomScaleAnimatedWidget(
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CustomCachedNetworkImage(
                  imageUrl: widget.place.images[0],
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPlaceItemInfo(place: widget.place),
            ),
          ],
        ),
      ),
    );
  }
}

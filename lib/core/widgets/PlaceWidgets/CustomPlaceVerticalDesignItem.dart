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
        padding: EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 50,
              spreadRadius: 10,
              offset: const Offset(5, 40),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CustomCachedNetworkImage(
                    imageUrl: widget.place.images[0],
                    boxFit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomPlaceItemInfo(place: widget.place),
          ],
        ),
      ),
    );
  }
}

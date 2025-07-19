import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceItemInfo.dart';

class CustomPlaceVerticalDesignItem extends StatefulWidget {
  const CustomPlaceVerticalDesignItem({super.key});
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
          image: DecorationImage(
            image: AssetImage(
              Assets.assetsImagesTestFavouritePlaceItemBackGround,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            CustomPlaceItemInfo().asGlass(
              clipBorderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

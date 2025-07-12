import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomFavouritePlaceWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceItemInfo.dart';

class CustomPlaceVerticalDesignItem extends StatelessWidget {
  const CustomPlaceVerticalDesignItem({super.key, required this.isFavourite});
  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CustomFavouritePlaceWidget(isFavourite: isFavourite),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomPlaceItemInfo().asGlass(
                clipBorderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

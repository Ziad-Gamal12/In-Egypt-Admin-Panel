import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';

class CustomPlacesSliverGrid extends StatelessWidget {
  const CustomPlacesSliverGrid({super.key, required this.maxWidth});
  final double maxWidth;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(maxWidth),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: getItemAspectRatio(maxWidth),
      ),
      itemBuilder: (context, index) {
        return CustomPlaceVerticalDesignItem(isFavourite: false);
      },
    );
  }

  double getItemAspectRatio(double maxWidth) {
    int crossAxisCount = getCrossAxisCount(maxWidth);
    double spacing = 16;
    double totalSpacing = spacing * (crossAxisCount - 1);
    double itemWidth = (maxWidth - totalSpacing) / crossAxisCount;

    double itemHeight = itemWidth * 1.3;
    return itemWidth / itemHeight;
  }

  int getCrossAxisCount(double maxWidth) {
    if (maxWidth >= 1200) return 5;
    if (maxWidth >= 900) return 4;
    if (maxWidth >= 600) return 3;
    return 2; // For phones
  }
}

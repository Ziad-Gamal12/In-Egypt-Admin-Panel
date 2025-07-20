import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';

class CustomPlacesSliverGrid extends StatefulWidget {
  const CustomPlacesSliverGrid({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<CustomPlacesSliverGrid> createState() => _CustomPlacesSliverGridState();
}

class _CustomPlacesSliverGridState extends State<CustomPlacesSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(widget.maxWidth),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: getItemAspectRatio(widget.maxWidth),
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showBottomSheet(
              context: context,
              builder: (_) {
                return PlaceDetailsViewBody();
              },
            );
          },
          child: CustomPlaceVerticalDesignItem(),
        );
      },
    );
  }

  double getItemAspectRatio(double maxWidth) {
    int crossAxisCount = getCrossAxisCount(maxWidth);
    double spacing = 20;
    double totalSpacing = spacing * (crossAxisCount - 1);
    double itemWidth = (maxWidth - totalSpacing) / crossAxisCount;

    double itemHeight = itemWidth * 1.3;
    return itemWidth / itemHeight;
  }

  int getCrossAxisCount(double maxWidth) {
    if (maxWidth >= 1200) return 5;
    if (maxWidth >= 900) return 4;
    if (maxWidth >= 600) return 3;
    if (maxWidth >= 250) return 2;
    return 1; // For phones
  }
}

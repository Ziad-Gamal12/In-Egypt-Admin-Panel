import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomBottomSheetUpperDivider.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';

class CustomPlacesSliverGrid extends StatefulWidget {
  const CustomPlacesSliverGrid({
    super.key,
    required this.maxWidth,
    required this.places,
  });
  final double maxWidth;
  final List<PlaceEntity> places;
  @override
  State<CustomPlacesSliverGrid> createState() => _CustomPlacesSliverGridState();
}

class _CustomPlacesSliverGridState extends State<CustomPlacesSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.places.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(widget.maxWidth),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: getItemAspectRatio(widget.maxWidth),
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              useRootNavigator: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              builder: (_) {
                return Column(
                  children: [
                    const SizedBox(height: 16),
                    CustomBottomSheetUpperDivider(),
                    SizedBox(height: 16),
                    Expanded(
                      child: PlaceDetailsViewBody(place: widget.places[index]),
                    ),
                  ],
                );
              },
            );
          },
          child: CustomPlaceVerticalDesignItem(place: widget.places[index]),
        );
      },
    );
  }

  double getItemAspectRatio(double maxWidth) {
    int crossAxisCount = getCrossAxisCount(maxWidth);
    double spacing = 20;
    double totalSpacing = spacing * (crossAxisCount - 1);
    double itemWidth = (maxWidth - totalSpacing) / crossAxisCount;

    double itemHeight = itemWidth * 1.4;
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

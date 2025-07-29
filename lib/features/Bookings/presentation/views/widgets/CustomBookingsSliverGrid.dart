import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingItem.dart';

class CustomBookingsSliverGrid extends StatefulWidget {
  const CustomBookingsSliverGrid({
    super.key,
    required this.maxWidth,
    required this.bookings,
  });
  final double maxWidth;
  final List<BookingEntity> bookings;

  @override
  State<CustomBookingsSliverGrid> createState() =>
      _CustomBookingsSliverGridState();
}

class _CustomBookingsSliverGridState extends State<CustomBookingsSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(widget.maxWidth),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: getItemAspectRatio(widget.maxWidth),
      ),
      itemCount: widget.bookings.length,
      itemBuilder: (context, index) {
        return CustomBookingItem(booking: widget.bookings[index]);
      },
    );
  }

  double getItemAspectRatio(double maxWidth) {
    int crossAxisCount = getCrossAxisCount(maxWidth);
    double spacing = 20;
    double totalSpacing = spacing * (crossAxisCount - 1);
    double itemWidth = (maxWidth - totalSpacing) / crossAxisCount;

    double itemHeight = itemWidth * getAspectRatioHightprecentage(maxWidth);
    return itemWidth / itemHeight;
  }

  double getAspectRatioHightprecentage(double maxWidth) {
    if (maxWidth >= 600) return 1.52;
    return 1.4;
  }

  int getCrossAxisCount(double maxWidth) {
    if (maxWidth >= 1200) return 5;
    if (maxWidth >= 900) return 4;
    if (maxWidth >= 600) return 3;
    if (maxWidth >= 360) return 2;

    return 1; // For phones
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingItem.dart';

class CustomDashboardBookingsSliverGrid extends StatelessWidget {
  const CustomDashboardBookingsSliverGrid({super.key, required this.maxWidth});
  final double maxWidth;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: getGridCrossAxisCount(maxWidth: maxWidth),
      ),
      itemCount: Variables.testBookingsList.length,
      itemBuilder: (context, index) =>
          CustomBookingItem(booking: Variables.testBookingsList[index]),
    );
  }

  int getGridCrossAxisCount({required double maxWidth}) {
    if (maxWidth <= 600) {
      return 2;
    } else if (maxWidth <= 860) {
      return 3;
    } else {
      return 4;
    }
  }
}

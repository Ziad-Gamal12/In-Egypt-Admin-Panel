import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/helpers/GetGridItemCountsAndAspect.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingItem.dart';

class CustomBookingsSliverGrid extends StatelessWidget {
  const CustomBookingsSliverGrid({super.key, required this.maxWidth});
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
      itemCount: Variables.testBookingsList.length,
      itemBuilder: (context, index) {
        return CustomBookingItem(booking: Variables.testBookingsList[index]);
      },
    );
  }
}

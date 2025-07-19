import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';

class CustomBookingsMobileAndTabletListView extends StatelessWidget {
  const CustomBookingsMobileAndTabletListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AspectRatio(
            aspectRatio: 1 / 1.2,
            child: CustomPlaceVerticalDesignItem(),
          ),
        );
      },
    );
  }
}

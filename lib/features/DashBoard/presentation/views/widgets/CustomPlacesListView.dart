import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';

class CustomPlacesListView extends StatelessWidget {
  const CustomPlacesListView({super.key, required this.places});
  final List<PlaceEntity> places;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AspectRatio(
            aspectRatio: 1 / 1.5,
            child: CustomPlaceVerticalDesignItem(place: places[index]),
          ),
        );
      },
    );
  }
}

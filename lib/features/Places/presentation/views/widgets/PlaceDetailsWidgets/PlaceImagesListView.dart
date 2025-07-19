import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceImage.dart';

class PlaceImagesListView extends StatelessWidget {
  const PlaceImagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AspectRatio(aspectRatio: 1, child: CustomPlaceImage()),
        );
      },
      itemCount: 5,
    );
  }
}

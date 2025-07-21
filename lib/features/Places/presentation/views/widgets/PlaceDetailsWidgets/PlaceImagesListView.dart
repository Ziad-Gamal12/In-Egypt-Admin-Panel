import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceImage.dart';

class PlaceImagesListView extends StatelessWidget {
  const PlaceImagesListView({super.key, required this.imagesUrls});
  final List<String> imagesUrls;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomPlaceImage(imageUrl: imagesUrls[index]),
          ),
        );
      },
      itemCount: imagesUrls.length,
    );
  }
}

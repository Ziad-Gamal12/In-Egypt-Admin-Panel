import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';

class CustomPlaceImage extends StatelessWidget {
  const CustomPlaceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        Assets.assetsImagesTestFavouritePlaceItemBackGround,
        fit: BoxFit.cover,
      ),
    );
  }
}

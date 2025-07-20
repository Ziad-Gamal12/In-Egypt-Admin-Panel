import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';

class CustomPlaceDetailsItemImage extends StatelessWidget {
  const CustomPlaceDetailsItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(
              Assets.assetsImagesTestFavouritePlaceItemBackGround,
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

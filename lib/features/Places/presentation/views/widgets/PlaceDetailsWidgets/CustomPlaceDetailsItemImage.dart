import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';

class CustomPlaceDetailsItemImage extends StatelessWidget {
  const CustomPlaceDetailsItemImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: FittedBox(child: CustomCachedNetworkImage(imageUrl: imageUrl)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';

class CustomPlaceImage extends StatelessWidget {
  const CustomPlaceImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CustomCachedNetworkImage(imageUrl: imageUrl),
    );
  }
}

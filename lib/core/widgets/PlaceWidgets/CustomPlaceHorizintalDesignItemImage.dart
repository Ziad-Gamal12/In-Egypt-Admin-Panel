import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';

class CustomPlaceHorizintalDesignItemImage extends StatelessWidget {
  const CustomPlaceHorizintalDesignItemImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomCachedNetworkImage(imageUrl: imageUrl),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage({super.key, required this.imageUrl, this.boxFit});
  final String imageUrl;
  BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      height: 50,
      width: 50,
      errorWidget: (context, url, error) {
        return const Icon(Icons.error, color: Colors.red);
      },
    );
  }
}

import 'dart:developer';

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
      fit: boxFit ?? BoxFit.cover,
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.amber),
        );
      },
      errorWidget: (context, url, error) {
        log(error.toString());
        return const Icon(Icons.error, color: Colors.red);
      },
    );
  }
}

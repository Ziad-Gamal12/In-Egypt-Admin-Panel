// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage({super.key, required this.imageUrl, this.boxFit});
  final String imageUrl;
  BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit ?? BoxFit.cover,
      placeholder: (context, url) => Skeletonizer(
        containersColor: Colors.grey.shade100,
        child: Container(color: Colors.grey.shade100, height: 200, width: 200),
      ),
      errorWidget: (context, url, error) {
        log(error.toString());
        return const Icon(Icons.error, color: Colors.red);
      },
    );
  }
}

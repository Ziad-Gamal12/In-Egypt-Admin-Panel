import 'package:flutter/material.dart';

class CustomRatingStarItem extends StatelessWidget {
  const CustomRatingStarItem({super.key, required this.isFilled});
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return !isFilled
        ? Icon(Icons.star_rate_rounded, color: Colors.grey.shade300)
        : const Icon(Icons.star_rate_rounded, color: Colors.amber);
  }
}

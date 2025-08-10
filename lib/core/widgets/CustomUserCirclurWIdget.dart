import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';

class CustomUserCirclurWidget extends StatelessWidget {
  const CustomUserCirclurWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        height: 50,
        width: 50,
        child: CustomCachedNetworkImage(imageUrl: imageUrl),
      ),
    );
  }
}

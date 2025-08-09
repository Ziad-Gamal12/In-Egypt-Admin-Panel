import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomUserCirclurWIdget.dart';

class SelectedUserUserProfileImageCircleAvatar extends StatelessWidget {
  const SelectedUserUserProfileImageCircleAvatar({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.yellow.shade100, width: 2),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 40,
        child: CustomUserCirclurWidget(imageUrl: imageUrl),
      ),
    );
  }
}

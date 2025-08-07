import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomUserCirclurWIdget.dart';

class CustomUserMibleAndTabletUserProfilePic extends StatelessWidget {
  const CustomUserMibleAndTabletUserProfilePic({
    super.key,
    required this.profilePicUrl,
  });

  final String profilePicUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomUserCirclurWidget(imageUrl: profilePicUrl),
    );
  }
}

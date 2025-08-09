import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';

class CustomUsersUserProfilePic extends StatelessWidget {
  const CustomUsersUserProfilePic({super.key, required this.profilePicUrl});

  final String profilePicUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: CustomCachedNetworkImage(
          imageUrl: profilePicUrl == ""
              ? "https://cdn-icons-png.flaticon.com/128/16683/16683419.png"
              : profilePicUrl,
        ),
      ),
    );
  }
}

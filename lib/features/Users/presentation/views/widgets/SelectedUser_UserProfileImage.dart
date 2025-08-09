import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUserUserProfileImageBackGround.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUserUserProfileImageCircleAvatar.dart';

class SelectedUserUserProfileImage extends StatelessWidget {
  const SelectedUserUserProfileImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 6 / 1,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: SelectedUserUserProfileImageBackGround()),
            Positioned(
              bottom: -25,
              right: 0,
              left: 0,
              child: SelectedUserUserProfileImageCircleAvatar(
                imageUrl: imageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

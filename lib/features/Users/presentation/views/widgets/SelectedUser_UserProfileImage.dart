import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/helpers/getUserData.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomUserCirclurWIdget.dart';

class SelectedUserUserProfileImage extends StatelessWidget {
  const SelectedUserUserProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: AspectRatio(
        aspectRatio: 4 / .8,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -45,
              right: 0,
              left: 0,
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 50,
                child: CustomUserCirclurWidget(
                  imageUrl: getUserData().photoUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

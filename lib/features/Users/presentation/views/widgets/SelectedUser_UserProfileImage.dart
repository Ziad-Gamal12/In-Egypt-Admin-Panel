import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/helpers/getUserData.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomUserCirclurWIdget.dart';

class SelectedUserUserProfileImage extends StatelessWidget {
  const SelectedUserUserProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.all(25),
      child: CircleAvatar(
        backgroundColor: Colors.amber,
        radius: 50,
        child: CustomUserCirclurWidget(imageUrl: getUserData().photoUrl),
      ),
    );
  }
}

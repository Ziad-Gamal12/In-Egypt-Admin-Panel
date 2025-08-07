import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersUserProfilePic.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsers_UserInfo.dart';

class CustomUserItem extends StatelessWidget {
  const CustomUserItem({super.key, required this.userEntity});
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return CustomScaleAnimatedWidget(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xffF3F3F3), width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomUsersUserProfilePic(
                profilePicUrl: userEntity.photoUrl,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 6,
              child: CustomUsersUserInfo(userEntity: userEntity),
            ),
          ],
        ),
      ),
    );
  }
}

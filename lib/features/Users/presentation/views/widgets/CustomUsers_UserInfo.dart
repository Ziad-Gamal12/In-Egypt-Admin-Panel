import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class CustomUsersUserInfo extends StatelessWidget {
  const CustomUsersUserInfo({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${userEntity.firstName} ${userEntity.lastName}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles(context).bold14,
        ),
        Text(
          userEntity.email,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles(context).regular13,
        ),
      ],
    );
  }
}

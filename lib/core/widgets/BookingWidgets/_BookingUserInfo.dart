// ignore_for_file: unused_element, file_names

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomUserCirclurWIdget.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class BookingUserInfo extends StatelessWidget {
  final UserEntity userEntity;

  const BookingUserInfo({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(5),
      title: Text(
        " ${userEntity.firstName} ${userEntity.lastName}",
        style: AppTextStyles(context).semiBold14.copyWith(color: Colors.black),
      ),
      subtitle: Text(
        userEntity.email,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles(context).regular10.copyWith(color: Colors.black),
      ),
      leading: CustomUserCirclurWidget(imageUrl: userEntity.photoUrl),
    );
  }
}

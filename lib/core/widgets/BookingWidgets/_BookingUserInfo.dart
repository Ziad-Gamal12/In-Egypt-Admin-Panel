// ignore_for_file: unused_element, file_names

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class BookingUserInfo extends StatelessWidget {
  final UserEntity userEntity;

  const BookingUserInfo({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      title: Text(
        " ${userEntity.firstName} ${userEntity.lastName}",
        style: AppTextStyles(context).semiBold16.copyWith(color: Colors.black),
      ),
      subtitle: Text(
        userEntity.email,
        style: AppTextStyles(context).regular10.copyWith(color: Colors.black),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CustomCachedNetworkImage(
          imageUrl: userEntity.photoUrl == ""
              ? "https://cdn-icons-png.flaticon.com/128/16683/16683419.png"
              : userEntity.photoUrl,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomUsersHeader extends StatelessWidget {
  const CustomUsersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "المستخدمين",
          style: AppTextStyles(
            context,
          ).semiBold24.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          "1204 مستخدم",
          style: AppTextStyles(context).regular10.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomUsersHeaderInfo extends StatelessWidget {
  const CustomUsersHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "المستخدمين",
      style: AppTextStyles(context).semiBold24.copyWith(color: Colors.black),
    );
  }
}

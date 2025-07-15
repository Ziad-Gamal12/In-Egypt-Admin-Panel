import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomBookingsHeader extends StatelessWidget {
  const CustomBookingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "حجوزات المستخدمين",
      style: AppTextStyles(context).semiBold16.copyWith(color: Colors.black),
    );
  }
}

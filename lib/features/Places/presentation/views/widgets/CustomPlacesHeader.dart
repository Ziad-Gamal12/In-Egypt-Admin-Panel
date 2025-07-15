import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomPlacesHeader extends StatelessWidget {
  const CustomPlacesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "الاماكن المضافة في الوقت الحالي",
      style: AppTextStyles(context).semiBold16.copyWith(color: Colors.black),
    );
  }
}

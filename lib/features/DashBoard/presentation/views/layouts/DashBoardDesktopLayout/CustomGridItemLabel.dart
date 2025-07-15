import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomGridItemLabel extends StatelessWidget {
  const CustomGridItemLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        textAlign: TextAlign.end,
        style: AppTextStyles(context).semiBold11.copyWith(color: Colors.black),
      ),
    );
  }
}

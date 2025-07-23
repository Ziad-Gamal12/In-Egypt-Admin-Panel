import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.assetsIconsError, height: 150, width: 150),
        const SizedBox(height: 20),
        Text(
          message,
          textAlign: TextAlign.center,
          style: AppTextStyles(context).semiBold20.copyWith(color: Colors.red),
        ),
      ],
    );
  }
}

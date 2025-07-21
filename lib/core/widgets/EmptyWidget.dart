import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50),
        Image.asset(
          Assets.assetsIconsEmptyIcon,
          height: 150,
          width: 150,
          fit: BoxFit.scaleDown,
        ),
        Text(
          "لا يوجد شيء",
          textAlign: TextAlign.center,
          style: AppTextStyles(
            context,
          ).semiBold20.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

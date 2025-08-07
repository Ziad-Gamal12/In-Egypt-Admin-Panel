import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomFillterAndSortHeader extends StatelessWidget {
  const CustomFillterAndSortHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "الترتيب و التصنيف",
          style: AppTextStyles(
            context,
          ).semiBold20.copyWith(color: Colors.black),
        ),
        IconButton(
          icon: Transform.rotate(
            angle: 3.14,
            child: Center(
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          onPressed: () => GoRouter.of(context).pop(context),
        ),
      ],
    );
  }
}

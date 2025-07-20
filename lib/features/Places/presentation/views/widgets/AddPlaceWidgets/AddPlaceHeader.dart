import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class AddPlaceHeader extends StatelessWidget {
  const AddPlaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.close, color: Colors.red),
          onPressed: () => GoRouter.of(context).pop(context),
        ),
        Spacer(),
        Text(
          "اضافة مكان",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        Spacer(),
      ],
    );
  }
}

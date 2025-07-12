import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomSeperatedWidget extends StatelessWidget {
  const CustomSeperatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
        const SizedBox(width: 10),
        Text(
          "أو",
          style: AppTextStyles(context).regular14.copyWith(color: Colors.grey),
        ),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
      ],
    );
  }
}

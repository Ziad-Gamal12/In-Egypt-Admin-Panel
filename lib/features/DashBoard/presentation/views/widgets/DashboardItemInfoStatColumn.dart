import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class DashboardItemInfoStatColumn extends StatelessWidget {
  const DashboardItemInfoStatColumn({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  final String iconPath;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(iconPath, height: 20, width: 20),
              const SizedBox(width: 2),
              Text(
                label,
                style: AppTextStyles(
                  context,
                ).semiBold14.copyWith(color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "$value",
            style: AppTextStyles(
              context,
            ).semiBold24.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

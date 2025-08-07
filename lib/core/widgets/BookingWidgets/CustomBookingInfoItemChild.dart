import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomBookingInfoItemChild extends StatelessWidget {
  const CustomBookingInfoItemChild({
    super.key,
    required this.label,
    required this.value,
    required this.iconPath,
  });

  final String label, value, iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppTextStyles(
              context,
            ).semiBold14.copyWith(color: Colors.black),
          ),
          SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath, height: 15, width: 15),
              const SizedBox(width: 1),
              Text(
                label,
                style: AppTextStyles(
                  context,
                ).regular14.copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

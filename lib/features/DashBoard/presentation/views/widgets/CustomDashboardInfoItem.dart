import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomDashboardInfoItem extends StatelessWidget {
  const CustomDashboardInfoItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.number,
  });
  final String title, iconPath, number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, height: 40, width: 40),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles(
                  context,
                ).regular14.copyWith(color: Colors.black),
              ),
              Text(
                number,
                style: AppTextStyles(
                  context,
                ).bold16.copyWith(color: Colors.amber),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

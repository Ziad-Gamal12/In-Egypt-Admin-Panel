import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class AboutPlaceSection extends StatelessWidget {
  const AboutPlaceSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "تفاصيل المكان",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Text(
            description,
            style: AppTextStyles(
              context,
            ).regular11.copyWith(color: Colors.grey),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

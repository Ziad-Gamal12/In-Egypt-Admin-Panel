import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomPlaceReviewsSectionHeader extends StatelessWidget {
  const CustomPlaceReviewsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "التقييمات",
          style: AppTextStyles(
            context,
          ).semiBold20.copyWith(color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.star_rate_rounded, color: Colors.amber),
            const SizedBox(width: 5),
            Text(
              "4.5",
              style: AppTextStyles(
                context,
              ).semiBold20.copyWith(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}

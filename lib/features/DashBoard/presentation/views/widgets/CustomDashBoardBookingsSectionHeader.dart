import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomDashBoardBookingsSectionHeader extends StatelessWidget {
  const CustomDashBoardBookingsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: SvgPicture.asset(
            Assets.assetsIconsBookingsIcon,
            height: 30,
            width: 30,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            "أحدث الحجوزات",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles(
              context,
            ).semiBold24.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

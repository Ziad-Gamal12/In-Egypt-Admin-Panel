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
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            "نبذة عن الحجوزات",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles(
              context,
            ).semiBold20.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

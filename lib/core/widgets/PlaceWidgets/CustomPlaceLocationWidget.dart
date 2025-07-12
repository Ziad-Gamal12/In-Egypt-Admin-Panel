import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomPlaceLocationWidget extends StatelessWidget {
  const CustomPlaceLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(Assets.assetsIconsLocationIcon),
        SizedBox(width: 5),
        Text(
          "الجيزه, مصر",
          style: AppTextStyles(context).medium12.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomRatingStarsRow.dart';

class CustomPlaceRatingWidget extends StatelessWidget {
  const CustomPlaceRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRatingStarsRow(),
        SizedBox(width: 5),
        Text(
          "4.5",
          style: AppTextStyles(context).medium12.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

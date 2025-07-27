import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomSlider.dart';

class CustomFillterPlacesPriceSlider extends StatelessWidget {
  const CustomFillterPlacesPriceSlider({
    super.key,
    required this.maxPrice,
    required this.onChanged,
  });

  final double maxPrice;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "السعر يبدا ب",
                style: AppTextStyles(
                  context,
                ).semiBold14.copyWith(color: Colors.black),
              ),
              TextSpan(
                text: " ${maxPrice.toInt()} ",
                style: AppTextStyles(
                  context,
                ).regular14.copyWith(color: Colors.amber),
              ),
              TextSpan(
                text: "جنيه",
                style: AppTextStyles(
                  context,
                ).regular14.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text("0", style: AppTextStyles(context).regular14),
            SizedBox(width: 10),
            Expanded(
              child: CustomSlider(value: maxPrice, onChanged: onChanged),
            ),
            SizedBox(width: 10),
            Text("2000", style: AppTextStyles(context).regular14),
          ],
        ),
      ],
    );
  }
}

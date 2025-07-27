import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomRadioButton.dart';

class CustomFillterPlacesRatingRadioButtons extends StatefulWidget {
  const CustomFillterPlacesRatingRadioButtons({
    super.key,
    required this.ratingIsDescending,
  });
  final ValueChanged<bool> ratingIsDescending;
  @override
  State<CustomFillterPlacesRatingRadioButtons> createState() =>
      _CustomFillterPlacesRatingRadioButtonsState();
}

class _CustomFillterPlacesRatingRadioButtonsState
    extends State<CustomFillterPlacesRatingRadioButtons> {
  String groupValue = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomRadioButton(
            value: "أعلى تقييم",
            isLabelShown: true,
            onChanged: (val) {
              if (val != null && val.isNotEmpty && val != groupValue) {
                setState(() {
                  groupValue = val;
                });
                widget.ratingIsDescending(true);
              }
            },
            groupValue: groupValue,
          ),
          CustomRadioButton(
            value: "اقل تقييم",
            isLabelShown: true,
            onChanged: (val) {
              if (val != null && val.isNotEmpty && val != groupValue) {
                setState(() {
                  groupValue = val;
                });
                widget.ratingIsDescending(false);
              }
            },
            groupValue: groupValue,
          ),
        ],
      ),
    );
  }
}

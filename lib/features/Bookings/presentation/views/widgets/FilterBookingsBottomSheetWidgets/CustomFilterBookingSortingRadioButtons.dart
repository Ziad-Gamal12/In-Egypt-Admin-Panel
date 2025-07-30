import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomRadioButton.dart';

class CustomFilterBookingSortingRadioButtons extends StatefulWidget {
  const CustomFilterBookingSortingRadioButtons({super.key});

  @override
  State<CustomFilterBookingSortingRadioButtons> createState() =>
      _CustomFilterBookingSortingRadioButtonsState();
}

class _CustomFilterBookingSortingRadioButtonsState
    extends State<CustomFilterBookingSortingRadioButtons> {
  String groupValue = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomRadioButton(
            value: "الأحدث",
            onChanged: (val) {
              if (val != null && val.isNotEmpty && val != groupValue) {
                setState(() {
                  groupValue = val;
                });
              }
            },

            isLabelShown: true,
            groupValue: groupValue,
          ),

          CustomRadioButton(
            value: "الأقدم",
            onChanged: (val) {
              if (val != null && val.isNotEmpty && val != groupValue) {
                setState(() {
                  groupValue = val;
                });
              }
            },
            isLabelShown: true,
            groupValue: groupValue,
          ),
        ],
      ),
    );
  }
}

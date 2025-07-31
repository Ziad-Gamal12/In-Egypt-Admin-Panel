import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomRadioButton.dart';

class CustomFilterBookingSortingRadioButtons extends StatefulWidget {
  const CustomFilterBookingSortingRadioButtons({
    super.key,
    required this.isCreatedAtDescending,
  });
  final ValueChanged<bool> isCreatedAtDescending;
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRadioButton(
            value: "ترتيب الحجوزات(الأحدث الى الأقدم)",
            onChanged: (val) {
              if (val != null && val.isNotEmpty && val != groupValue) {
                setState(() {
                  groupValue = val;
                });
                widget.isCreatedAtDescending(true);
              }
            },

            isLabelShown: true,
            groupValue: groupValue,
          ),
          SizedBox(height: 20),
          CustomRadioButton(
            value: "ترتيب الحجوزات(الأقدم الى الأحدث)",
            onChanged: (val) {
              if (val != null && val.isNotEmpty && val != groupValue) {
                setState(() {
                  groupValue = val;
                });
                widget.isCreatedAtDescending(false);
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

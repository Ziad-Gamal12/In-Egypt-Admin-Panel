import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
    this.isLabelShown,
  });
  final String value;
  final ValueChanged<String?> onChanged;
  final String groupValue;
  bool? isLabelShown;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: kMainColor,
        ),
        if (isLabelShown == true)
          Text(
            value,
            style: AppTextStyles(
              context,
            ).regular14.copyWith(color: Colors.black),
          )
        else
          SizedBox(),
      ],
    );
  }
}

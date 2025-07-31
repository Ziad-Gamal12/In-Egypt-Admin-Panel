import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';

class CustomFilterButtons extends StatelessWidget {
  const CustomFilterButtons({
    super.key,
    required this.onApply,
    required this.onReset,
  });
  final VoidCallback onApply;
  final VoidCallback onReset;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Custombutton(
            text: "تطبيق",
            color: kMainColor,
            textColor: Colors.white,
            onPressed: onApply,
          ),
        ),
        SizedBox(width: 20),
        IconButton(
          onPressed: onReset,
          icon: Icon(Icons.remove_circle_outline, color: Colors.red, size: 40),
        ),
      ],
    );
  }
}

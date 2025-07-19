import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';

class SelectedUserActionButtons extends StatelessWidget {
  const SelectedUserActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custombutton(
          borderRadius: BorderRadius.circular(8),

          text: "تفعيل",
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        Custombutton(
          borderRadius: BorderRadius.circular(8),
          text: "حظر",
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}

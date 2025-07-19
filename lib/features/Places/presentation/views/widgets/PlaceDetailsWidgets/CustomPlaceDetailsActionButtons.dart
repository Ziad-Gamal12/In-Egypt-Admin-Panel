import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';

class CustomPlaceDetailsActionButtons extends StatelessWidget {
  const CustomPlaceDetailsActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custombutton(
          text: "تعديل البيانات",
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {},
        ),
        SizedBox(height: 10),
        Custombutton(
          text: "حذف المكان",
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}

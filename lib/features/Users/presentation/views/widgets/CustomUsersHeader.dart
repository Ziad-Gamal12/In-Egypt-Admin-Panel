import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersHeaderInfo.dart';

class CustomUsersHeader extends StatelessWidget {
  const CustomUsersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomUsersHeaderInfo(),
        Spacer(),
        Expanded(
          child: CustomSearchTextField(controller: TextEditingController()),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.ban, color: Colors.red),
        ),
      ],
    );
  }
}

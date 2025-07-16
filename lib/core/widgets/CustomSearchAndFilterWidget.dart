import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class CustomSearchAndFilterWidget extends StatelessWidget {
  const CustomSearchAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 17,
          child: CustomSearchTextField(controller: TextEditingController()),
        ),
        SizedBox(width: 20),
        FittedBox(
          child: IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.barsStaggered, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

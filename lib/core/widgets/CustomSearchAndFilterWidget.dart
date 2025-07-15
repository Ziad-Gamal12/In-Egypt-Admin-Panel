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
          flex: 16,
          child: CustomSearchTextField(controller: TextEditingController()),
        ),
        SizedBox(width: 20),
        Expanded(
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: FittedBox(
              child: IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.barsStaggered, color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

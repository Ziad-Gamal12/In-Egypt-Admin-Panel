import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class CustomBookingsSearchAndFilterWidget extends StatefulWidget {
  const CustomBookingsSearchAndFilterWidget({super.key});

  @override
  State<CustomBookingsSearchAndFilterWidget> createState() =>
      _CustomBookingsSearchAndFilterWidgetState();
}

class _CustomBookingsSearchAndFilterWidgetState
    extends State<CustomBookingsSearchAndFilterWidget> {
  TextEditingController controller = TextEditingController();
  Timer? debouncer;
  @override
  void initState() {
    controller.addListener(debounce);
    super.initState();
  }

  debounce() {
    if (debouncer != null && debouncer!.isActive) debouncer!.cancel();
    debouncer = Timer(const Duration(milliseconds: 500), () {});
  }

  @override
  void dispose() {
    controller.dispose();
    debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 17,
          child: CustomSearchTextField(controller: controller),
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

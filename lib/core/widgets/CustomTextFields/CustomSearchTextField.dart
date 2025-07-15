// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, required this.controller, this.hintText});
  String? hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? "ابحث عن ...",
        hintStyle: AppTextStyles(
          context,
        ).regular14.copyWith(color: const Color(0xffBABABA)),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.black,
            size: 20,
          ),
        ),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        filled: true,
        focusColor: Colors.white,
        fillColor: Color(0xffFAFAFA),
      ),
    );
  }
}

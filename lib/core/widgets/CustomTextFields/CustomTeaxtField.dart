// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class Customteaxtfield extends StatelessWidget {
  final String labelText;
  IconData? prefixIcon;
  Widget? suffixIcon;
  Color? filledColor;
  final bool obscureText;
  TextEditingController? controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  Function(String?)? onSaved;
  AutovalidateMode? autovalidateMode;
  int maxLines;
  Customteaxtfield({
    super.key,
    this.inputFormatters,
    required this.labelText,
    this.filledColor,
    this.autovalidateMode,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.controller,
    required this.textInputType,
    required this.validator,
    this.onSaved,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder initBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffBABABA)),
      borderRadius: BorderRadius.circular(15),
    );
    OutlineInputBorder activeBorder = OutlineInputBorder(
      borderSide: BorderSide(color: kMainColor),
      borderRadius: BorderRadius.circular(15),
    );
    return TextFormField(
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles(
          context,
        ).bold13.copyWith(color: const Color(0xffAEAEB2)),
        prefixIcon: Icon(prefixIcon, size: 24, color: const Color(0xffAEAEB2)),
        suffixIcon: suffixIcon,
        border: initBorder,
        focusedBorder: activeBorder,
        enabledBorder: initBorder,
        filled: true,
        focusColor: Colors.white,
        fillColor: filledColor ?? Colors.white,
      ),
    );
  }
}

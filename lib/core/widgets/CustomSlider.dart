import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key, required this.onChanged, required this.value});
  final void Function(double)? onChanged;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      min: 0,
      max: 2000,
      activeColor: kMainColor,
      semanticFormatterCallback: (value) {
        return value.round().toString();
      },
      label: value.round().toString(),
    );
  }
}

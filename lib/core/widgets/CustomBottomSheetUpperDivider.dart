import 'package:flutter/material.dart';

class CustomBottomSheetUpperDivider extends StatelessWidget {
  const CustomBottomSheetUpperDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 120),
      width: double.infinity,
      height: 2,
      color: Colors.grey,
    );
  }
}

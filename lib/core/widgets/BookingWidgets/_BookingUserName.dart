// ignore_for_file: unused_element, file_names

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingUserName extends StatelessWidget {
  final String userName;

  const BookingUserName({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Text(
      userName,
      style: AppTextStyles(context).semiBold16.copyWith(color: Colors.black),
    );
  }
}

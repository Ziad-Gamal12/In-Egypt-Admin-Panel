import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingPaymentMethod extends StatelessWidget {
  final String method;

  const BookingPaymentMethod({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    return Text(
      "($method)",
      style: AppTextStyles(context).regular14.copyWith(color: Colors.black),
    );
  }
}

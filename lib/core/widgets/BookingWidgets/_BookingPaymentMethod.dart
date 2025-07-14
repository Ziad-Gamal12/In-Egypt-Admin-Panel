import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingPaymentMethod extends StatelessWidget {
  final String method;

  const BookingPaymentMethod({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(FontAwesomeIcons.creditCard, size: 15, color: Colors.black),
        const SizedBox(width: 10),
        Text(
          method,
          style: AppTextStyles(context).regular14.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

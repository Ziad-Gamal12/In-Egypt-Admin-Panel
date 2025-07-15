import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingTotalPrice extends StatelessWidget {
  final double price;

  const BookingTotalPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(FontAwesomeIcons.sackDollar, size: 15, color: Colors.black),
        const SizedBox(width: 10),
        Text(
          "$price جنيه",
          style: AppTextStyles(context).semiBold14.copyWith(color: Colors.red),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingDateRow extends StatelessWidget {
  final DateTime start;
  final DateTime end;

  const BookingDateRow({super.key, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.calendarDays,
          size: 15,
          color: Colors.black,
        ),
        const SizedBox(width: 10),
        Text(
          "${start.day}/${start.month} - ${end.day}/${end.month}",
          style: AppTextStyles(context).regular14.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingDateRow extends StatelessWidget {
  final DateTime start;
  final DateTime end;

  const BookingDateRow({super.key, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            FontAwesomeIcons.calendarDays,
            size: 20,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "من ${start.day}-${start.month}-${start.year}",
                style: AppTextStyles(
                  context,
                ).regular14.copyWith(color: Colors.black),
              ),
              Text(
                "الى ${end.day}-${end.month}-${end.year} ",
                style: AppTextStyles(
                  context,
                ).regular14.copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

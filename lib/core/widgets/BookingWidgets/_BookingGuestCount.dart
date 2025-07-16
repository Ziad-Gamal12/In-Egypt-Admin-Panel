import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingGuestCount extends StatelessWidget {
  final int count;

  const BookingGuestCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.users, size: 20, color: Colors.black),
          const SizedBox(width: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "عدد الزوار: ",
                  style: AppTextStyles(
                    context,
                  ).regular14.copyWith(color: Colors.black),
                ),
                TextSpan(
                  text: "$count",
                  style: AppTextStyles(
                    context,
                  ).regular14.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

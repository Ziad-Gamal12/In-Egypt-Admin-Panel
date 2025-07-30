import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/BookingStatusEntity.dart';

class FilterBookingsStatusListViewItem extends StatelessWidget {
  const FilterBookingsStatusListViewItem({super.key, required this.status});
  final BookingStatusEntity status;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          status.iconPath,
          height: 20,
          width: 20,
          fit: BoxFit.scaleDown,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(status.arStatus, style: AppTextStyles(context).regular14),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingStatusBadge extends StatelessWidget {
  final String status;

  const BookingStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 12),

      color: getBadgeColor(status),

      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          getBadgeText(status),
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  String getBadgeText(String status) {
    if (status == "pending") {
      return "قيد الانتظار";
    } else if (status == "approved") {
      return "نجاح";
    } else if (status == "rejected") {
      return "رفض";
    } else {
      return "غير معروف";
    }
  }

  Color getBadgeColor(String status) {
    if (status == "pending") {
      return Colors.black;
    } else if (status == "approved") {
      return Colors.green;
    } else if (status == "rejected") {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}

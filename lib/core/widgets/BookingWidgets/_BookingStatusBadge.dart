import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class BookingStatusBadge extends StatelessWidget {
  final String status;

  const BookingStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: getBadgeColor(status),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
      child: Text(
        getBadgeText(status),
        style: AppTextStyles(context).regular14.copyWith(color: Colors.white),
      ),
    );
  }

  String getBadgeText(String status) {
    if (status == "pending") {
      return "قيد الانتظار";
    } else if (status == "confirmed") {
      return "نجاح";
    } else if (status == "rejected" || status == "cancelled") {
      return "رفض";
    } else {
      return "غير معروف";
    }
  }

  Color getBadgeColor(String status) {
    if (status == "pending") {
      return Colors.black;
    } else if (status == "confirmed") {
      return Colors.green;
    } else if (status == "rejected" || status == "cancelled") {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}

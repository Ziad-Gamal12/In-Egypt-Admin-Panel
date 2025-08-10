import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingInfoSection.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingStatusBadge.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingUserInfo.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';

// Main Booking Card Widget
class CustomBookingItem extends StatefulWidget {
  const CustomBookingItem({super.key, required this.booking});
  final BookingEntity booking;

  @override
  State<CustomBookingItem> createState() => _CustomBookingItemState();
}

class _CustomBookingItemState extends State<CustomBookingItem> {
  @override
  Widget build(BuildContext context) {
    return CustomScaleAnimatedWidget(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade400),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(5, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingUserInfo(userEntity: widget.booking.user),
            Divider(height: 1, color: Colors.grey.shade400),
            SizedBox(height: 10),
            CustomBookingInfoSection(booking: widget.booking),
            SizedBox(height: 10),
            BookingStatusBadge(status: widget.booking.status),
          ],
        ),
      ),
    );
  }
}

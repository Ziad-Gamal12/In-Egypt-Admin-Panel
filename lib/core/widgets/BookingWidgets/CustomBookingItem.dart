import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingDateRow.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingGuestCount.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingPaymentMethod.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingStatusBadge.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingTotalPrice.dart';
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
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: getborderColor(widget.booking.status)),
          boxShadow: [
            BoxShadow(
              color: getShadeColor(widget.booking.status),
              blurRadius: 50,
              spreadRadius: 10,
              offset: const Offset(5, 40),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingUserInfo(userEntity: widget.booking.user),
            Divider(height: 1, color: Colors.grey.shade400),
            BookingDateRow(
              start: widget.booking.startAt,
              end: widget.booking.endAt,
            ),
            Divider(height: 1, color: Colors.grey.shade400),
            BookingGuestCount(count: widget.booking.numberOfGuests),
            Divider(height: 1, color: Colors.grey.shade400),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  BookingTotalPrice(price: widget.booking.totalPrice),
                  SizedBox(width: 5),
                  BookingPaymentMethod(method: widget.booking.paymentMethod),
                ],
              ),
            ),
            const Spacer(),
            BookingStatusBadge(status: widget.booking.status),
          ],
        ),
      ),
    );
  }

  Color getborderColor(String status) {
    if (status == "pending") {
      return Colors.black;
    } else if (status == "approved") {
      return Colors.green;
    } else if (status == "rejected" || status == "canceled") {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Color getShadeColor(String status) {
    if (status == "pending") {
      return Colors.black26;
    } else if (status == "approved") {
      return Colors.green.shade100;
    } else if (status == "rejected" || status == "canceled") {
      return Colors.red.shade100;
    } else {
      return Colors.black26;
    }
  }
}

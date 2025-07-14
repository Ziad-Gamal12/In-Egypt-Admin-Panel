import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingDateRow.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingGuestCount.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingPaymentMethod.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingStatusBadge.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingTotalPrice.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingUserName.dart';

// Main Booking Card Widget
class CustomBookingItem extends StatelessWidget {
  const CustomBookingItem({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookingUserName(
                    userName:
                        "${booking.user.firstName} ${booking.user.lastName}",
                  ),
                  const SizedBox(height: 10),
                  BookingDateRow(start: booking.startAt, end: booking.endAt),
                  const SizedBox(height: 10),

                  BookingGuestCount(count: booking.numberOfGuests),
                  const SizedBox(height: 10),
                  BookingPaymentMethod(method: booking.paymentMethod),
                  const Spacer(),
                  BookingTotalPrice(price: booking.totalPrice),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          BookingStatusBadge(status: booking.status),
        ],
      ),
    );
  }
}

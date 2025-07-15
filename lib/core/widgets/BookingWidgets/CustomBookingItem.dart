import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingDateRow.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingGuestCount.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingPaymentMethod.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingStatusBadge.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingTotalPrice.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingUserName.dart';
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
          color: Colors.grey.shade50,
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
                          "${widget.booking.user.firstName} ${widget.booking.user.lastName}",
                    ),
                    const SizedBox(height: 10),
                    BookingDateRow(
                      start: widget.booking.startAt,
                      end: widget.booking.endAt,
                    ),
                    const SizedBox(height: 10),

                    BookingGuestCount(count: widget.booking.numberOfGuests),
                    const SizedBox(height: 10),
                    BookingPaymentMethod(method: widget.booking.paymentMethod),
                    const Spacer(),
                    BookingTotalPrice(price: widget.booking.totalPrice),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            BookingStatusBadge(status: widget.booking.status),
          ],
        ),
      ),
    );
  }
}

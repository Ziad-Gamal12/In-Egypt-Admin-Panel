import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/BookingStatusEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingsStatusSection.dart';

class CustomBookingStatusSection extends StatelessWidget {
  CustomBookingStatusSection({
    super.key,
    required this.onStatusSelected,
    this.bookingstatusentity,
  });
  final ValueChanged<BookingStatusEntity> onStatusSelected;
  BookingStatusEntity? bookingstatusentity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "حالة الحجز",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        SizedBox(height: 10),
        BookingsStatusSection(
          onStatusSelected: onStatusSelected,
          bookingstatusentity: bookingstatusentity,
        ),
      ],
    );
  }
}

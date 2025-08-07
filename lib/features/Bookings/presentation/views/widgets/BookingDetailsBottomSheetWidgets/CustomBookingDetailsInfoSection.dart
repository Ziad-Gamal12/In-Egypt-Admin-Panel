import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/CustomBookingDetailsInfoGridView.dart';

class CustomBookingDetailsInfoSection extends StatelessWidget {
  const CustomBookingDetailsInfoSection({
    super.key,
    required this.bookingEntity,
  });

  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تفاصيل الحجز",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 10),
        CustomBookingDetailsInfoGridView(bookingEntity: bookingEntity),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/BookingStatusEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsStatusListViewItem.dart';

class FilterBookingsStatusSectionSelectStatusButton extends StatelessWidget {
  const FilterBookingsStatusSectionSelectStatusButton({
    super.key,
    required this.bookingStatusEntity,
  });
  final BookingStatusEntity? bookingStatusEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          if (bookingStatusEntity == null)
            Text(
              "حالة الحجز",
              style: AppTextStyles(
                context,
              ).regular14.copyWith(color: Colors.grey),
            )
          else
            Expanded(
              child: FilterBookingsStatusListViewItem(
                status: bookingStatusEntity!,
              ),
            ),
          Spacer(),
          Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    );
  }
}

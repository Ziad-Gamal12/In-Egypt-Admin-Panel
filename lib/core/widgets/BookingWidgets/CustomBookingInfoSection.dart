import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingInfoItem.dart';

class CustomBookingInfoSection extends StatelessWidget {
  const CustomBookingInfoSection({super.key, required this.booking});
  final BookingEntity booking;
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 5 / 3.5,
      ),
      children: [
        CustomBookingInfoItem(
          label: "الايام",
          value: "${booking.daysDuration}",
          iconPath: Assets.assetsIconsDaysDuration,
        ),
        CustomBookingInfoItem(
          label: "الافراد",
          value: "${booking.numberOfGuests}",
          iconPath: Assets.assetsIconsUsersIcon,
        ),
        CustomBookingInfoItem(
          label: "المبلغ",
          value: "${booking.totalPrice}",
          iconPath: Assets.assetsIconsMoney,
        ),
        CustomBookingInfoItem(
          label: "الدفع",
          value: booking.paymentMethod,
          iconPath: Assets.assetsIconsPaymentMethod,
        ),
      ],
    );
  }
}

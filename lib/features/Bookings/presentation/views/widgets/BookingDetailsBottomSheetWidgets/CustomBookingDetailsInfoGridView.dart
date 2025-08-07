import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/CustomBookingDetailsInfoItem.dart';

class CustomBookingDetailsInfoGridView extends StatelessWidget {
  const CustomBookingDetailsInfoGridView({
    super.key,
    required this.bookingEntity,
  });
  final BookingEntity bookingEntity;
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      children: [
        CustomBookingDetailsInfoItem(
          title: "تاريخ البدء",
          iconPath: Assets.assetsIconsDateRange,
          value:
              "${bookingEntity.startAt.year}/${bookingEntity.startAt.month}/${bookingEntity.startAt.day}",
        ),
        CustomBookingDetailsInfoItem(
          title: "تاريخ الانتهاء",
          iconPath: Assets.assetsIconsDateRange,

          value:
              "${bookingEntity.endAt.year}/${bookingEntity.endAt.month}/${bookingEntity.endAt.day}",
        ),
        CustomBookingDetailsInfoItem(
          iconPath: Assets.assetsIconsDaysDuration,

          title: "عدد الايام",
          value: "${bookingEntity.daysDuration}",
        ),
        CustomBookingDetailsInfoItem(
          iconPath: Assets.assetsIconsUsersIcon,
          title: "عدد الافراد",
          value: "${bookingEntity.numberOfGuests}",
        ),
        CustomBookingDetailsInfoItem(
          title: "السعر الكلي",
          iconPath: Assets.assetsIconsMoney,

          value: "${bookingEntity.totalPrice}",
        ),
        CustomBookingDetailsInfoItem(
          title: "طريقة الدفع",
          iconPath: Assets.assetsIconsPaymentMethod,
          value: bookingEntity.paymentMethod,
        ),
      ],
    );
  }
}

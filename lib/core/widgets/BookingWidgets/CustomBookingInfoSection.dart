import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingInfoItem.dart';

class CustomBookingInfoSection extends StatefulWidget {
  const CustomBookingInfoSection({super.key, required this.booking});
  final BookingEntity booking;

  @override
  State<CustomBookingInfoSection> createState() =>
      _CustomBookingInfoSectionState();
}

class _CustomBookingInfoSectionState extends State<CustomBookingInfoSection> {
  late List<CustomBookingInfoItem> items;
  @override
  void initState() {
    items = [
      CustomBookingInfoItem(
        label: "الايام",
        value: widget.booking.daysDuration.toString(),
        iconPath: Assets.assetsIconsDaysDuration,
      ),
      CustomBookingInfoItem(
        label: "الافراد",
        value: widget.booking.numberOfGuests.toString(),
        iconPath: Assets.assetsIconsUsersIcon,
      ),
      CustomBookingInfoItem(
        label: "المبلغ",
        value: widget.booking.totalPrice.toString(),
        iconPath: Assets.assetsIconsMoney,
      ),
      CustomBookingInfoItem(
        label: "الدفع",
        value: widget.booking.paymentMethod,
        iconPath: Assets.assetsIconsPaymentMethod,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 5 / 3.5,
      ),
      itemBuilder: (context, index) => items[index],
      itemCount: items.length,
    );
  }
}

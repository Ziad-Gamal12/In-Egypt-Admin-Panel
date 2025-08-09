import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingInfoItemChild.dart';

class CustomBookingInfoItem extends StatefulWidget {
  const CustomBookingInfoItem({
    super.key,
    required this.label,
    required this.value,
    required this.iconPath,
  });
  final String label, value, iconPath;

  @override
  State<CustomBookingInfoItem> createState() => _CustomBookingInfoItemState();
}

class _CustomBookingInfoItemState extends State<CustomBookingInfoItem> {
  @override
  Widget build(BuildContext context) {
    return CustomBookingInfoItemChild(
      label: widget.label,
      value: widget.value,
      iconPath: widget.iconPath,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: ClipRRect(
        borderRadius: isHovered
            ? BorderRadiusGeometry.circular(10)
            : BorderRadiusGeometry.zero,
        child: Animate(
          target: isHovered == true ? 1 : 0,
          effects: [
            ColorEffect(begin: Colors.white, end: Colors.grey.shade200),
          ],
          child: CustomBookingInfoItemChild(
            label: widget.label,
            value: widget.value,
            iconPath: widget.iconPath,
          ),
        ),
      ),
    );
  }
}

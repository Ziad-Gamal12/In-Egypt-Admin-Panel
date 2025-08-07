import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:svg_flutter/svg.dart';

class CustomBookingDetailsInfoItem extends StatelessWidget {
  const CustomBookingDetailsInfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.iconPath,
  });
  final String title, value, iconPath;
  @override
  Widget build(BuildContext context) {
    return CustomScaleAnimatedWidget(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade50,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const Spacer(),
            Text(
              value,
              style: AppTextStyles(
                context,
              ).bold16.copyWith(color: Colors.black),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 20,
                  width: 20,
                  color: Colors.black,
                ),
                const SizedBox(width: 5),
                Text(
                  title,
                  style: AppTextStyles(
                    context,
                  ).semiBold14.copyWith(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

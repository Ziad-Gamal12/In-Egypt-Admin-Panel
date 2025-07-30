import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class SelectDateItem extends StatelessWidget {
  const SelectDateItem({
    super.key,
    required this.onTap,
    required this.date,
    required this.color,
  });
  final VoidCallback onTap;
  final String date;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_month, color: color),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                date,
                style: AppTextStyles(context).regular14.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

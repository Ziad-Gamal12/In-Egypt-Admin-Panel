import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/SelectPlaceCategoryEntity.dart';

class SelectPlaceCategoryItem extends StatelessWidget {
  const SelectPlaceCategoryItem({
    super.key,
    required this.e,
    required this.isSelect,
  });
  final MapEntry<int, SelectPlaceCategoryEntity> e;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelect ? kMainColor : Colors.grey,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Image.asset(e.value.imagePath, height: 40, width: 40),
            SizedBox(width: 10),
            Text(
              e.value.arTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles(
                context,
              ).regular11.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

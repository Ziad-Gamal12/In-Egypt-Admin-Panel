import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/PickUserRoleOptionsEntity.dart';

class CustomSelectUserRoleItem extends StatelessWidget {
  const CustomSelectUserRoleItem({
    super.key,
    required this.isSelected,
    required this.e,
  });

  final bool isSelected;
  final PickUserRoleOptionsEntity e;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.amber : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? null : Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Image.asset(e.imagePath, height: 25, width: 25),
          const SizedBox(width: 10),
          Text(
            e.title,
            style: AppTextStyles(
              context,
            ).medium12.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

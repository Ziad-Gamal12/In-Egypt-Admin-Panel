import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/CustomDrawerItemEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:svg_flutter/svg.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.drawerItemEntity,
    required this.isActive,
  });
  final CustomDrawerItemEntity drawerItemEntity;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isActive ? Colors.amber : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            drawerItemEntity.iconPath,
            color: isActive ? Colors.black : Colors.white,
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 8),
          Text(
            drawerItemEntity.title,
            style: AppTextStyles(
              context,
            ).regular14.copyWith(color: isActive ? Colors.black : Colors.white),
          ),
        ],
      ),
    );
  }
}

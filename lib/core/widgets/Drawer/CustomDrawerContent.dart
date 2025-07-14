import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/CustomDrawerItemEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerContentActionsItems.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerItem.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerUserinfo.dart';

class CustomDrawerContent extends StatefulWidget {
  const CustomDrawerContent({
    super.key,
    required this.currentIndex,
    required this.currentIndexChanged,
  });
  final ValueChanged<int> currentIndexChanged;
  final int currentIndex;

  @override
  State<CustomDrawerContent> createState() => _CustomDrawerContentState();
}

class _CustomDrawerContentState extends State<CustomDrawerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDrawerUserinfo(),
          SizedBox(height: 20),
          CustomDrawerContentActionsItems(
            currentIndex: widget.currentIndex,
            currentIndexChanged: widget.currentIndexChanged,
          ),
          Spacer(),
          CustomDrawerItem(
            drawerItemEntity: CustomDrawerItemEntity(
              iconPath: Assets.assetsIconsLogoutIcon,
              title: "تسجيل الخروج",
            ),
            isActive: false,
          ),
        ],
      ),
    );
  }
}

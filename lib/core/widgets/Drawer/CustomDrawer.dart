import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerContent.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.currentIndex,
    required this.currentIndexChanged,
  });
  final ValueChanged<int> currentIndexChanged;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomDrawerContent(
        currentIndex: currentIndex,
        currentIndexChanged: currentIndexChanged,
      ),
    );
  }
}

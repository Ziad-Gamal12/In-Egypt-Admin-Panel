import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerContent.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.currentIndexChanged});
  final ValueChanged<int> currentIndexChanged;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomDrawerContent(currentIndexChanged: currentIndexChanged),
    );
  }
}

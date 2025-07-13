import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/layouts/Desktop/DesktopLayout.dart';
import 'package:in_egypt_admin_panel/layouts/MobileAndTablet/MobileAndTabletLayout.dart';

class CustomAdminResponsiceLayout extends StatefulWidget {
  const CustomAdminResponsiceLayout({super.key});
  static const String routeName = '/AdminResponsiveLayout';
  @override
  State<CustomAdminResponsiceLayout> createState() =>
      _CustomAdminResponsiceLayoutState();
}

class _CustomAdminResponsiceLayoutState
    extends State<CustomAdminResponsiceLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        if (constrains.maxWidth < 1024) {
          return MobileAndTabletLayout();
        } else {
          return DesktopLayout();
        }
      },
    );
  }
}

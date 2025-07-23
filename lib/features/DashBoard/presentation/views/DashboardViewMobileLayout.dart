import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawer.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardMobileAndTabletLayout/DashboardMobileAndTabletLayout.dart';

class DashboardViewMobileLayout extends StatefulWidget {
  const DashboardViewMobileLayout({super.key});
  @override
  State<DashboardViewMobileLayout> createState() =>
      _DashboardViewMobileLayoutState();
}

class _DashboardViewMobileLayoutState extends State<DashboardViewMobileLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "الصفحة الرئيسية"),
      drawer: CustomDrawer(currentIndex: currentIndex),
      body: Dashboardmobileandtabletlayout(),
    );
  }
}

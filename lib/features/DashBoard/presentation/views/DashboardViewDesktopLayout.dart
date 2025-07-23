import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomDesktopDeshBaordLayoutWidget.dart';

class DashboardViewDesktopLayout extends StatefulWidget {
  const DashboardViewDesktopLayout({super.key});

  @override
  State<DashboardViewDesktopLayout> createState() =>
      _DashboardViewDesktopLayoutState();
}

class _DashboardViewDesktopLayoutState
    extends State<DashboardViewDesktopLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDesktopDeshBaordLayoutWidget(currentIndex: currentIndex),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomDesktopDeshBaordLayoutWidget.dart';

class PlacesViewDesktopLayout extends StatefulWidget {
  const PlacesViewDesktopLayout({super.key});

  @override
  State<PlacesViewDesktopLayout> createState() =>
      _PlacesViewDesktopLayoutState();
}

class _PlacesViewDesktopLayoutState extends State<PlacesViewDesktopLayout> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDesktopDeshBaordLayoutWidget(currentIndex: currentIndex),
    );
  }
}

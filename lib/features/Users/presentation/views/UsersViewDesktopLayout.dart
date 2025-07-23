import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomDesktopDeshBaordLayoutWidget.dart';

class UsersViewDesktopLayout extends StatefulWidget {
  const UsersViewDesktopLayout({super.key});

  @override
  State<UsersViewDesktopLayout> createState() => _UsersViewDesktopLayoutState();
}

class _UsersViewDesktopLayoutState extends State<UsersViewDesktopLayout> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDesktopDeshBaordLayoutWidget(currentIndex: currentIndex),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomDesktopDeshBaordLayoutWidget.dart';

class BookingViewDesktopLayout extends StatefulWidget {
  const BookingViewDesktopLayout({super.key});

  @override
  State<BookingViewDesktopLayout> createState() =>
      _BookingViewDesktopLayoutState();
}

class _BookingViewDesktopLayoutState extends State<BookingViewDesktopLayout> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDesktopDeshBaordLayoutWidget(currentIndex: currentIndex),
    );
  }
}

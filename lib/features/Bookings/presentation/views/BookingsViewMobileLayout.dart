import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawer.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingsViewBody.dart';

class BookingsViewMobileLayout extends StatefulWidget {
  const BookingsViewMobileLayout({super.key});
  @override
  State<BookingsViewMobileLayout> createState() =>
      _BookingsViewMobileLayoutState();
}

class _BookingsViewMobileLayoutState extends State<BookingsViewMobileLayout> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "الحجوزات"),
      drawer: CustomDrawer(currentIndex: currentIndex),
      body: BookingsViewBody(),
    );
  }
}

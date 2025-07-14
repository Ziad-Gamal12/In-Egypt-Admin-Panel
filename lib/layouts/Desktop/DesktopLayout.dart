import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerContent.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/BookingsViewBody.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/DashBaordViewBody.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/ManagePlacesViewBody.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/UsersViewBody.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  List<Widget> widgets = [
    DashBaordViewBody(),
    ManagePlacesViewBody(),
    BookingsViewBody(),
    UsersViewBody(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: CustomDrawerContent(
              currentIndex: currentIndex,
              currentIndexChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
          Expanded(flex: 5, child: widgets[currentIndex]),
        ],
      ),
    );
  }
}

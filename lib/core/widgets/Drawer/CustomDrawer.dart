import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerContent.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/ResponsiveBookingsView.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/ResponsiveDashBaoardView.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/ResponsivePlacesView.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/ResponsiveUsersView.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomDrawerContent(
        currentIndex: currentIndex,
        currentIndexChanged: (val) {
          if (val != currentIndex) {
            if (val == 0) {
              GoRouter.of(context).push(ResponsiveDashBaoardView.routeName);
            } else if (val == 1) {
              GoRouter.of(context).push(ResponsivePlacesView.routeName);
            } else if (val == 2) {
              GoRouter.of(context).push(ResponsiveBookingsView.routeName);
            } else if (val == 3) {
              GoRouter.of(context).push(ResponsiveUsersView.routeName);
            }
          }
        },
      ),
    );
  }
}

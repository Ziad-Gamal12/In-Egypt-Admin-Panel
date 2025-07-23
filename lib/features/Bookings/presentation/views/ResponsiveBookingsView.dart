import 'package:flutter/widgets.dart';
import 'package:in_egypt_admin_panel/ResponsiveLayout%20.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/BookingViewDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/BookingsViewMobileLayout.dart';

class ResponsiveBookingsView extends StatelessWidget {
  const ResponsiveBookingsView({super.key});
  static const String routeName = '/ResponsiveBookingsView';
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const BookingsViewMobileLayout(),
      desktop: const BookingViewDesktopLayout(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/BookingsTabel.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardBookingsSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardCard.dart';

class CustomDashBoardBookingsSection extends StatelessWidget {
  const CustomDashBoardBookingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Customdashboardcard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDashBoardBookingsSectionHeader(),
          SizedBox(height: 20),
          Expanded(child: BookingsTabel()),
        ],
      ),
    );
  }
}

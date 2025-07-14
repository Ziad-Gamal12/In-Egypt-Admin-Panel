import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomBookingsMobileAndTabletListView.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionHeader.dart';

class CustomDashBoardPlacesSectionMobileAndTabletLayout
    extends StatelessWidget {
  const CustomDashBoardPlacesSectionMobileAndTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDashBoardPlacesSectionHeader(),
        SizedBox(height: 20),
        Expanded(child: CustomBookingsMobileAndTabletListView()),
      ],
    );
  }
}

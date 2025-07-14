import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardBookingsSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardInfoRow.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionMobileAndTabletLayout.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardBookingsSliverGrid.dart';

class Dashboardmobileandtabletlayout extends StatelessWidget {
  const Dashboardmobileandtabletlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomDashBoardInfoRow(),
                Divider(height: 40, color: Colors.grey.shade400),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: CustomDashBoardPlacesSectionMobileAndTabletLayout(),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(height: 40, color: Colors.grey.shade400),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomDashBoardBookingsSectionHeader(),
                SizedBox(height: 20),
              ],
            ),
          ),
          CustomDashboardBookingsSliverGrid(maxWidth: constraints.maxWidth),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardBookingsSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardInfoRow.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionLayout.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardBookingsSliverGrid.dart';

class Dashboardmobileandtabletlayout extends StatefulWidget {
  const Dashboardmobileandtabletlayout({super.key});

  @override
  State<Dashboardmobileandtabletlayout> createState() =>
      _DashboardmobileandtabletlayoutState();
}

class _DashboardmobileandtabletlayoutState
    extends State<Dashboardmobileandtabletlayout> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().getPlaces(isPaginated: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: LayoutBuilder(
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
                height: MediaQuery.of(context).size.height * .8,
                child: CustomDashBoardPlacesSectionLayout(),
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
      ),
    );
  }
}

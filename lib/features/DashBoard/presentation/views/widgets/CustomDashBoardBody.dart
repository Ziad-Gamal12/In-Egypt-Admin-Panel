import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/EmptyWidget.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardBookingsSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardInfoRow.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionLayout.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardBookingsSliverGrid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDashBoardBody extends StatefulWidget {
  const CustomDashBoardBody({super.key});

  @override
  State<CustomDashBoardBody> createState() => _CustomDashBoardBodyState();
}

class _CustomDashBoardBodyState extends State<CustomDashBoardBody> {
  @override
  void initState() {
    initActions();
    super.initState();
  }

  Future<void> initActions() async {
    Future.wait([
      context.read<DashboardCubit>().getPlaces(isPaginated: false),
      context.read<DashboardCubit>().getDashBoardInfo(),
      context.read<DashboardCubit>().getDashBoardBookings(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) {
        if (current is DashboardGetDashBoardBookingsFailure) {
          return true;
        } else if (current is DashboardGetDashBoardBookingsSuccess) {
          return true;
        } else if (current is DashboardGetDashBoardBookingsLoading) {
          return true;
        } else if (current is DashboardGetDashBoardInfoLoading) {
          return true;
        } else if (current is DashboardGetPlacesLoading) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizentalPadding,
            vertical: kVerticalPadding,
          ),
          child: Skeletonizer(
            enabled:
                state is DashboardGetDashBoardBookingsLoading ||
                state is DashboardGetDashBoardInfoLoading ||
                state is DashboardGetPlacesLoading,
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
                      height: MediaQuery.of(context).size.height * .65,
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
                  if (state is DashboardGetDashBoardBookingsFailure)
                    SliverToBoxAdapter(
                      child: CustomErrorWidget(message: state.errmessage),
                    )
                  else if (state is DashboardGetDashBoardBookingsSuccess &&
                      state.response.bookings.isEmpty)
                    SliverToBoxAdapter(child: Center(child: EmptyWidget()))
                  else if (state is DashboardGetDashBoardBookingsSuccess &&
                      state.response.bookings.isNotEmpty)
                    CustomDashboardBookingsSliverGrid(
                      maxWidth: constraints.maxWidth,
                      bookings: state.response.bookings,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardMobileAndTabletLayout/CustomBookingsMobileAndTabletListView.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardMobileAndTabletLayout/CustomDashBoardPlacesSectionHeader.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDashBoardPlacesSectionMobileAndTabletLayout
    extends StatelessWidget {
  const CustomDashBoardPlacesSectionMobileAndTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardGetPlacesSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDashBoardPlacesSectionHeader(),
              SizedBox(height: 20),
              Expanded(
                child: CustomBookingsMobileAndTabletListView(
                  places: state.places,
                ),
              ),
            ],
          );
        } else if (state is DashboardGetPlacesFailure) {
          return Center(
            child: Text(
              state.errmessage,
              style: AppTextStyles(
                context,
              ).semiBold20.copyWith(color: Colors.red),
            ),
          );
        } else if (state is DashboardGetPlacesLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDashBoardPlacesSectionHeader(),
                SizedBox(height: 20),
                Expanded(
                  child: CustomBookingsMobileAndTabletListView(places: []),
                ),
              ],
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDashBoardPlacesSectionHeader(),
              SizedBox(height: 20),
              Expanded(
                child: CustomBookingsMobileAndTabletListView(places: []),
              ),
            ],
          );
        }
      },
    );
  }
}

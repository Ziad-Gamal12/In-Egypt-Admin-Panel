import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomPlacesListView.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDashBoardPlacesSectionLayout extends StatelessWidget {
  const CustomDashBoardPlacesSectionLayout({super.key});

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
              Expanded(child: CustomPlacesListView(places: state.places)),
            ],
          );
        } else if (state is DashboardGetPlacesFailure) {
          return CustomErrorWidget(message: state.errmessage);
        } else if (state is DashboardGetPlacesLoading) {
          return Skeletonizer(
            enabled: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDashBoardPlacesSectionHeader(),
                SizedBox(height: 20),
                Expanded(child: CustomPlacesListView(places: [])),
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
              Expanded(child: CustomPlacesListView(places: [])),
            ],
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/EmptyWidget.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomPlacesListView.dart';

class CustomDashBoardPlacesSectionLayout extends StatefulWidget {
  const CustomDashBoardPlacesSectionLayout({super.key});

  @override
  State<CustomDashBoardPlacesSectionLayout> createState() =>
      _CustomDashBoardPlacesSectionLayoutState();
}

class _CustomDashBoardPlacesSectionLayoutState
    extends State<CustomDashBoardPlacesSectionLayout> {
  List<PlaceEntity> places = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is DashboardGetPlacesSuccess) {
          places = state.places;
          setState(() {});
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDashBoardPlacesSectionHeader(),
            SizedBox(height: 20),
            if (state is DashboardGetPlacesFailure)
              CustomErrorWidget(message: state.errmessage)
            else if (state is DashboardGetPlacesSuccess && state.places.isEmpty)
              Center(child: EmptyWidget())
            else
              Expanded(child: CustomPlacesListView(places: places)),
          ],
        );
      },
    );
  }
}

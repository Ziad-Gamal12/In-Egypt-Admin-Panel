import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomBottomSheetUpperDivider.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomPlacesListView extends StatelessWidget {
  const CustomPlacesListView({super.key, required this.places});
  final List<PlaceEntity> places;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is DashboardGetPlacesLoading,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AspectRatio(
                  aspectRatio: 1 / 1.5,
                  child: InkWell(
                    onTap: () {
                      showPlaceDetails(context, index);
                    },
                    child: CustomPlaceVerticalDesignItem(place: places[index]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void showPlaceDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (_) {
        return Column(
          children: [
            const SizedBox(height: 16),
            CustomBottomSheetUpperDivider(),
            SizedBox(height: 16),
            Expanded(child: PlaceDetailsViewBody(place: places[index])),
          ],
        );
      },
    );
  }
}

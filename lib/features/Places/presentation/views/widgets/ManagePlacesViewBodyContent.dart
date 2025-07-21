import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomSearchAndFilterWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/EmptyWidget.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomAddPlaceButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesHeader.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesSliverGrid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ManagePlacesViewBodyContent extends StatefulWidget {
  const ManagePlacesViewBodyContent({super.key});

  @override
  State<ManagePlacesViewBodyContent> createState() =>
      _ManagePlacesViewBodyContentState();
}

class _ManagePlacesViewBodyContentState
    extends State<ManagePlacesViewBodyContent> {
  @override
  void initState() {
    context.read<PlacesCubit>().getPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        if (state is PlacesGetPlacesFailure) {
          return CustomErrorWidget(message: state.errmessage);
        } else if (state is PlacesGetPlacesSuccess) {
          return LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSearchAndFilterWidget(),
                          SizedBox(height: 20),
                          CustomPlacesHeader(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    state.places.isEmpty
                        ? SliverToBoxAdapter(child: EmptyWidget())
                        : CustomPlacesSliverGrid(
                            maxWidth: constraints.maxWidth,
                            places: state.places,
                          ),
                  ],
                ),
                Positioned(left: 16, bottom: 16, child: CustomAddPlaceButton()),
              ],
            ),
          );
        } else if (state is PlacesGetPlacesLoading) {
          return Skeletonizer(
            enabled: true,
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSearchAndFilterWidget(),
                            SizedBox(height: 20),
                            CustomPlacesHeader(),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      CustomPlacesSliverGrid(
                        maxWidth: constraints.maxWidth,
                        places: [],
                      ),
                    ],
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: CustomAddPlaceButton(),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

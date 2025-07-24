import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomSearchAndFilterWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/EmptyWidget.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';
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
  ScrollController scrollController = ScrollController();
  List<PlaceEntity> places = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PlacesCubit>().getPlaces(isPaginated: false);
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<PlacesCubit>().getPlaces(isPaginated: true);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesGetPlacesSuccess) {
          log(state.places.length.toString());
          places.addAll(state.places);
          setState(() {});
        }
      },
      builder: (context, state) {
        if (state is PlacesGetPlacesFailure) {
          return Center(child: CustomErrorWidget(message: state.errmessage));
        } else {
          return LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Skeletonizer(
                  enabled: state is PlacesGetPlacesLoading,
                  child: CustomScrollView(
                    controller: scrollController,
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
                      if (places.isEmpty)
                        SliverToBoxAdapter(child: EmptyWidget())
                      else
                        CustomPlacesSliverGrid(
                          maxWidth: constraints.maxWidth,
                          places: places,
                        ),
                    ],
                  ),
                ),
                Positioned(left: 16, bottom: 16, child: CustomAddPlaceButton()),
              ],
            ),
          );
        }
      },
    );
  }
}

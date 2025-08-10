import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/EmptyWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/customRefreshWidget.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomAddPlaceButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesHeader.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesSearchAndFilterWidget.dart';
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
  late final ScrollController scrollController;

  bool isLoadMore = true;
  List<PlaceEntity> fetchedPlaces = [];
  List<PlaceEntity> filteredPlaces = [];

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PlacesCubit>().getPlaces(isPaginated: false);
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 200 &&
            isLoadMore) {
          context.read<PlacesCubit>().getPlaces(isPaginated: true);
        }
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Customrefreshwidget(
      onRefresh: () =>
          context.read<PlacesCubit>().getPlaces(isPaginated: false),

      child: BlocConsumer<PlacesCubit, PlacesState>(
        listener: (context, state) {
          if (state is PlacesGetPlacesSuccess) {
            if (!isLoadMore && state.responseEntity.hasMore) return;
            setState(() {
              if (state.responseEntity.places.isNotEmpty) {
                fetchedPlaces.addAll(state.responseEntity.places);
              }

              isLoadMore = state.responseEntity.hasMore;
            });
          }
        },
        builder: (context, state) {
          final bool isSearchSuccess = state is PlacesSearchPlacesSuccess;
          final List<PlaceEntity> searchedPlaces = isSearchSuccess
              ? state.places
              : [];
          return Skeletonizer(
            enabled: state is PlacesGetPlacesLoading,
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomPlacesSearchAndFilterWidget(
                              onPlacesChanged: (val) {
                                setState(() {
                                  filteredPlaces = val;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            const CustomPlacesHeader(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      if (state is PlacesSearchPlacesLoading)
                        const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(color: kMainColor),
                          ),
                        )
                      else if (filteredPlaces.isNotEmpty)
                        CustomPlacesSliverGrid(
                          maxWidth: constraints.maxWidth,
                          places: filteredPlaces,
                        )
                      else if (isSearchSuccess && searchedPlaces.isEmpty)
                        const SliverToBoxAdapter(child: EmptyWidget())
                      else if (isSearchSuccess)
                        CustomPlacesSliverGrid(
                          maxWidth: constraints.maxWidth,
                          places: searchedPlaces,
                        )
                      else if (state is PlacesGetPlacesSuccess &&
                          fetchedPlaces.isEmpty)
                        const SliverToBoxAdapter(child: EmptyWidget())
                      else
                        CustomPlacesSliverGrid(
                          maxWidth: constraints.maxWidth,
                          places: fetchedPlaces,
                        ),
                    ],
                  ),
                  const Positioned(
                    left: 16,
                    bottom: 16,
                    child: CustomAddPlaceButton(),
                  ),
                  if (state is PlacesGetPlacesFailure ||
                      state is PlacesSearchPlacesFailure)
                    Center(
                      child: CustomErrorWidget(
                        message: state is PlacesGetPlacesFailure
                            ? state.errmessage
                            : (state as PlacesSearchPlacesFailure).errmessage,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

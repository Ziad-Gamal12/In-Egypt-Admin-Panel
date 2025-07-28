import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/filter_places_cubit/filter_places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/FilterAndSortPlacesBottomSheetBody.dart';

class FilterAndSortPlacesBottomSheet extends StatefulWidget {
  const FilterAndSortPlacesBottomSheet({
    super.key,
    required this.onPlacesChanged,
  });
  final ValueChanged<List<PlaceEntity>> onPlacesChanged;

  @override
  State<FilterAndSortPlacesBottomSheet> createState() =>
      _FilterAndSortPlacesBottomSheetState();
}

class _FilterAndSortPlacesBottomSheetState
    extends State<FilterAndSortPlacesBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterPlacesCubit(placesRepo: getIt.get<PlacesRepo>()),
      child: Builder(
        builder: (context) {
          return FilterAndSortPlacesBottomSheetBody(
            onPlacesChanged: widget.onPlacesChanged,
          );
        },
      ),
    );
  }
}

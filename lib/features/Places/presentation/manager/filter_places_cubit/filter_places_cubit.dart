// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/FilterPlacesEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';

part 'filter_places_state.dart';

class FilterPlacesCubit extends Cubit<FilterPlacesState> {
  FilterPlacesCubit({required this.placesRepo}) : super(FilterPlacesInitial());
  final PlacesRepo placesRepo;
  Future<void> getFilteredPlaces({
    required FilterPlacesEntity filterPlacesEntity,
  }) async {
    emit(GetFilteredPlacesLoading());
    final result = await placesRepo.getFilteredPlaces(
      filterPlacesEntity: filterPlacesEntity,
    );
    result.fold(
      (failure) {
        emit(GetFilteredPlacesFailure(errmessage: failure.message));
      },
      (places) {
        emit(GetFilteredPlacesSuccess(places: places));
      },
    );
  }
}

part of 'filter_places_cubit.dart';

sealed class FilterPlacesState {}

final class FilterPlacesInitial extends FilterPlacesState {}

final class GetFilteredPlacesSuccess extends FilterPlacesState {
  final List<PlaceEntity> places;
  GetFilteredPlacesSuccess({required this.places});
}

final class GetFilteredPlacesFailure extends FilterPlacesState {
  final String errmessage;
  GetFilteredPlacesFailure({required this.errmessage});
}

final class GetFilteredPlacesLoading extends FilterPlacesState {}

import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';

abstract class PlacesState {}

final class PlacesInitial extends PlacesState {}

final class PlacesUploadPlaceImageLoading extends PlacesState {}

final class PlacesUploadPlaceImageSuccess extends PlacesState {
  final String url;
  PlacesUploadPlaceImageSuccess({required this.url});
}

final class PlacesUploadPlaceImageFailure extends PlacesState {
  final String errmessage;
  PlacesUploadPlaceImageFailure({required this.errmessage});
}

final class PlacesAddPlaceSuccess extends PlacesState {}

final class PlacesAddPlaceFailure extends PlacesState {
  final String errmessage;
  PlacesAddPlaceFailure({required this.errmessage});
}

final class PlacesAddPlaceLoading extends PlacesState {}

final class PlacesUpdatePlaceSuccess extends PlacesState {}

final class PlacesUpdatePlaceFailure extends PlacesState {
  final String errmessage;
  PlacesUpdatePlaceFailure({required this.errmessage});
}

final class PlacesUpdatePlaceLoading extends PlacesState {}

final class PlacesGetPlacesSuccess extends PlacesState {
  final List<PlaceEntity> places;
  PlacesGetPlacesSuccess({required this.places});
}

final class PlacesGetPlacesFailure extends PlacesState {
  final String errmessage;
  PlacesGetPlacesFailure({required this.errmessage});
}

final class PlacesGetPlacesLoading extends PlacesState {}

final class PlacesDeletePlaceSuccess extends PlacesState {}

final class PlacesDeletePlaceFailure extends PlacesState {
  final String errmessage;
  PlacesDeletePlaceFailure({required this.errmessage});
}

final class PlacesDeletePlaceLoading extends PlacesState {}

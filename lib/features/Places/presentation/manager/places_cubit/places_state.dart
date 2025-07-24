import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/GetplacesResponseEntity.dart';

abstract class PlacesState {}

final class PlacesInitial extends PlacesState {}

final class PlacesPickPlaceImagesLoading extends PlacesState {}

final class PlacesPickPlaceImagesSuccess extends PlacesState {
  final ImagePickerResult result;
  PlacesPickPlaceImagesSuccess({required this.result});
}

final class PlacesPickPlaceImagesFailure extends PlacesState {
  final String errmessage;
  PlacesPickPlaceImagesFailure({required this.errmessage});
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
  final GetplacesResponseEntity responseEntity;
  PlacesGetPlacesSuccess({required this.responseEntity});
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

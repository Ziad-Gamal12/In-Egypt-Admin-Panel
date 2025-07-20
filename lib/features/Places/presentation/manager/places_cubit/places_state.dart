part of 'places_cubit.dart';

@immutable
sealed class PlacesState {}

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

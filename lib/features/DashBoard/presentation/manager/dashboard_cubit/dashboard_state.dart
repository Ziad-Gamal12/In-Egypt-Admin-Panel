part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardGetPlacesSuccess extends DashboardState {
  final List<PlaceEntity> places;
  DashboardGetPlacesSuccess({required this.places});
}

final class DashboardGetPlacesFailure extends DashboardState {
  final String errmessage;
  DashboardGetPlacesFailure({required this.errmessage});
}

final class DashboardGetPlacesLoading extends DashboardState {}

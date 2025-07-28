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

final class DashboardGetDashBoardInfoLoading extends DashboardState {}

final class DashboardGetDashBoardInfoSuccess extends DashboardState {
  final DashBoardInfoEntity dashBoardInfoEntity;

  DashboardGetDashBoardInfoSuccess({required this.dashBoardInfoEntity});
}

final class DashboardGetDashBoardInfoFailure extends DashboardState {
  final String errmessage;

  DashboardGetDashBoardInfoFailure({required this.errmessage});
}

import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/repos/DashBoardRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.placesRepo, required this.dashBoardRepo})
    : super(DashboardInitial());
  final PlacesRepo placesRepo;
  final DashBoardRepo dashBoardRepo;
  getPlaces({required bool isPaginated}) async {
    try {
      emit(DashboardGetPlacesLoading());
      final result = await placesRepo.getPlaces(isPaginated: isPaginated);
      result.fold(
        (failure) {
          emit(DashboardGetPlacesFailure(errmessage: failure.message));
        },
        (response) {
          emit(DashboardGetPlacesSuccess(places: response.places));
        },
      );
    } catch (e) {
      emit(DashboardGetPlacesFailure(errmessage: "خطأ في جلب الاماكن"));
    }
  }

  Future<void> getDashBoardInfo() async {
    emit(DashboardGetDashBoardInfoLoading());
    final result = await dashBoardRepo.getDashBoardInfo();
    result.fold(
      (failure) {
        emit(DashboardGetDashBoardInfoFailure(errmessage: failure.message));
      },
      (response) {
        emit(DashboardGetDashBoardInfoSuccess(dashBoardInfoEntity: response));
      },
    );
  }
}

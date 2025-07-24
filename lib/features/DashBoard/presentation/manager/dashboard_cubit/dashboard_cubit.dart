import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.placesRepo}) : super(DashboardInitial());
  final PlacesRepo placesRepo;
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
}

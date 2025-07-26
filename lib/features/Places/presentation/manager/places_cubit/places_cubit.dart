import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/picker_assets_interface.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit({
    required this.pickerassetsservice,
    required this.storageService,
    required this.placesRepo,
  }) : super(PlacesInitial());
  final PickerAssetsInterface pickerassetsservice;
  final StorageService storageService;
  final PlacesRepo placesRepo;
  void pickPlaceImages() async {
    emit(PlacesPickPlaceImagesLoading());
    try {
      ImagePickerResult imagepickerResult = await pickerassetsservice
          .pickMultiImages();
      emit(PlacesPickPlaceImagesSuccess(result: imagepickerResult));
    } on CustomException catch (e) {
      emit(PlacesPickPlaceImagesFailure(errmessage: e.message));
    } catch (e) {
      emit(PlacesPickPlaceImagesFailure(errmessage: "خطأ في تحميل الصور"));
    }
  }

  void addPlace({
    required PlaceEntity placeEntity,
    required List images,
  }) async {
    try {
      emit(PlacesAddPlaceLoading());
      final result = await placesRepo.uploadPlaceImages(images: images);
      result.fold(
        (failure) {
          emit(PlacesAddPlaceFailure(errmessage: failure.message));
        },
        (images) async {
          placeEntity.images.addAll(images);
          final result = await placesRepo.addPlace(placeEntity: placeEntity);
          result.fold(
            (failure) {
              emit(PlacesAddPlaceFailure(errmessage: failure.message));
            },
            (success) {
              emit(PlacesAddPlaceSuccess());
            },
          );
        },
      );
    } catch (e) {
      emit(PlacesAddPlaceFailure(errmessage: "خطأ في إضافة المكان"));
    }
  }

  void updatePlace({
    required PlaceEntity placeEntity,
    required List images,
  }) async {
    try {
      emit(PlacesUpdatePlaceLoading());
      final result = await placesRepo.uploadPlaceImages(images: images);
      result.fold(
        (failure) {
          emit(PlacesUpdatePlaceFailure(errmessage: failure.message));
        },
        (images) async {
          placeEntity.images.addAll(images);
          final result = await placesRepo.updatePlace(placeEntity: placeEntity);
          result.fold(
            (failure) {
              emit(PlacesUpdatePlaceFailure(errmessage: failure.message));
            },
            (success) {
              emit(PlacesUpdatePlaceSuccess());
            },
          );
        },
      );
    } catch (e) {
      emit(PlacesUpdatePlaceFailure(errmessage: "خطأ في تحديث المكان"));
    }
  }

  void deletePlace({required String placeId}) async {
    try {
      emit(PlacesDeletePlaceLoading());

      final result = await placesRepo.deletePlace(placeId: placeId);
      result.fold(
        (failure) {
          emit(PlacesDeletePlaceFailure(errmessage: failure.message));
        },
        (success) {
          emit(PlacesDeletePlaceSuccess());
        },
      );
    } catch (e) {
      emit(PlacesDeletePlaceFailure(errmessage: "خطأ في حذف المكان"));
    }
  }

  getPlaces({required bool isPaginated}) async {
    emit(PlacesGetPlacesLoading());

    final result = await placesRepo.getPlaces(isPaginated: isPaginated);
    result.fold(
      (failure) {
        emit(PlacesGetPlacesFailure(errmessage: failure.message));
      },
      (places) {
        emit(PlacesGetPlacesSuccess(responseEntity: places));
      },
    );
  }

  void selectPlaceMainImage({required String url}) {
    emit(PlacesSelectPlaceMainImageSuccess(imageUrl: url));
  }
}

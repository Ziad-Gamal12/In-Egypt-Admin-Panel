import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit({
    required this.pickerassetsservice,
    required this.storageService,
    required this.placesRepo,
  }) : super(PlacesInitial());
  final Pickerassetsservice pickerassetsservice;
  final StorageService storageService;
  final PlacesRepo placesRepo;
  void uploadPlaceImage() async {
    try {
      emit(PlacesUploadPlaceImageLoading());
      imagePickerResult? imagepickerResult = await pickerassetsservice.getImage(
        source: ImageSource.gallery,
      );
      if (imagepickerResult == null) {
        emit(PlacesUploadPlaceImageFailure(errmessage: "الصورة غير موجودة"));
      } else {
        try {
          String url = await storageService.uploadFile(
            imagepickerresult: imagepickerResult,
          );
          emit(PlacesUploadPlaceImageSuccess(url: url));
        } on CustomException catch (e) {
          emit(PlacesUploadPlaceImageFailure(errmessage: e.message));
        }
      }
    } catch (e) {
      emit(PlacesUploadPlaceImageFailure(errmessage: "خطأ في تحميل الصورة"));
    }
  }

  void addPlace({required PlaceEntity placeEntity}) async {
    try {
      emit(PlacesAddPlaceLoading());
      final result = await placesRepo.addPlace(placeEntity: placeEntity);
      result.fold(
        (failure) {
          emit(PlacesAddPlaceFailure(errmessage: failure.message));
        },
        (success) {
          emit(PlacesAddPlaceSuccess());
        },
      );
    } catch (e) {
      emit(PlacesAddPlaceFailure(errmessage: "خطأ في إضافة المكان"));
    }
  }

  void updatePlace({required PlaceEntity placeEntity}) async {
    try {
      emit(PlacesUpdatePlaceLoading());
      final result = await placesRepo.updatePlace(placeEntity: placeEntity);
      result.fold(
        (failure) {
          emit(PlacesUpdatePlaceFailure(errmessage: failure.message));
        },
        (success) {
          emit(PlacesUpdatePlaceSuccess());
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

  void getPlaces() async {
    try {
      emit(PlacesGetPlacesLoading());
      final result = await placesRepo.getPlaces();
      result.fold(
        (failure) {
          emit(PlacesGetPlacesFailure(errmessage: failure.message));
        },
        (places) {
          emit(PlacesGetPlacesSuccess(places: places));
        },
      );
    } catch (e) {
      log(e.toString());
      emit(PlacesGetPlacesFailure(errmessage: "خطأ في جلب المكانات"));
    }
  }
}

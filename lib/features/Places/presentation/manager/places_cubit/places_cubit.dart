import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit({required this.pickerassetsservice, required this.storageService})
    : super(PlacesInitial());
  final Pickerassetsservice pickerassetsservice;
  final StorageService storageService;
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
}

import 'package:image_picker/image_picker.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';

abstract class PickerAssetsInterface {
  Future<ImagePickerResult> pickMultiImages();
  Future<dynamic> getVideo({required ImageSource source});
}

// ignore_for_file: file_names

import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';

abstract class StorageService {
  Future<String> uploadFile({required imagePickerResult imagepickerresult});
  Future<void> deleteFile({required String url});
}

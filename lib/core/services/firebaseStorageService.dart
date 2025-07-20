// ignore_for_file: camel_case_types, depend_on_referenced_packages, file_names, await_only_futures

import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';

class firebasestorageservice implements StorageService {
  final storage = FirebaseStorage.instance;
  final Pickerassetsservice pickerassetsservice;
  firebasestorageservice({required this.pickerassetsservice});
  @override
  Future<String> uploadFile({
    required imagePickerResult imagepickerresult,
  }) async {
    try {
      Reference ref = storage.ref(imagepickerresult.fileName);
      if (imagepickerresult.file != null) {
        String url = await ref
            .putFile(imagepickerresult.file!)
            .then((p0) => p0.ref.getDownloadURL());
        return url;
      } else if (imagepickerresult.bytes != null) {
        String url = await ref
            .putData(imagepickerresult.bytes!)
            .then((p0) => p0.ref.getDownloadURL());
        return url;
      } else {
        throw CustomException(message: "خطأ في تحميل الصورة");
      }
    } catch (e) {
      log(
        "Exception from firebasestorageservice.uploadFile in catch With Firebase Exception: ${e.toString()}",
      );
      throw CustomException(message: "خطأ في تحميل الصورة");
    }
  }

  @override
  Future<void> deleteFile({required String url}) async {
    await storage.refFromURL(url).delete();
  }
}

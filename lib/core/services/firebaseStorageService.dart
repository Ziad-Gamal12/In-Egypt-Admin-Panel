// ignore_for_file: camel_case_types, depend_on_referenced_packages, file_names, await_only_futures

import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/picker_assets_interface.dart';

class firebasestorageservice implements StorageService {
  final storage = FirebaseStorage.instance;
  final PickerAssetsInterface pickerassetsservice;
  firebasestorageservice({required this.pickerassetsservice});
  @override
  Future<String> uploadFile({
    File? file,
    required String fileName,
    Uint8List? bytes,
  }) async {
    try {
      Reference ref = storage.ref(fileName);
      if (file != null) {
        String url = await ref
            .putFile(file)
            .then((p0) => p0.ref.getDownloadURL());
        return url;
      } else if (bytes != null) {
        String url = await ref
            .putData(bytes)
            .then((p0) => p0.ref.getDownloadURL());
        return url;
      } else {
        throw CustomException(message: "خطأ في تحميل الصورة");
      }
    } catch (e) {
      throw CustomException(message: "خطأ في تحميل الصورة");
    }
  }

  @override
  Future<void> deleteFile({required String url}) async {
    await storage.refFromURL(url).delete();
  }
}

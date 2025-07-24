// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';

abstract class StorageService {
  Future<String> uploadFile({
    File? file,
    required String fileName,
    Uint8List? bytes,
  });
  Future<void> deleteFile({required String url});
}

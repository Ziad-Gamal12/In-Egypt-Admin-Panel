// ignore_for_file: file_names

import 'dart:async';
import 'dart:html' as html;
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:path/path.dart';

class Pickerassetsservice {
  final ImagePicker picker = ImagePicker();

  Future<imagePickerResult?> getImage({required ImageSource source}) async {
    if (kIsWeb) {
      return _pickImageWeb();
    } else {
      return _pickImageMobile(source: source);
    }
  }

  Future<imagePickerResult?> _pickImageWeb() async {
    final uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    final completer = Completer<imagePickerResult?>();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files?.first;
      if (file == null) {
        completer.complete(null);
        return;
      }
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((event) {
        final data = reader.result as Uint8List;
        completer.complete(imagePickerResult(bytes: data, fileName: file.name));
      });
    });

    return completer.future;
  }

  Future<imagePickerResult?> _pickImageMobile({
    required ImageSource source,
  }) async {
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) return null;

    return imagePickerResult(
      file: io.File(pickedFile.path),
      fileName: basename(pickedFile.path),
    );
  }

  Future<io.File?> getVideo({required ImageSource source}) async {
    if (kIsWeb) {
      return null;
    }
    final XFile? pickedFile = await picker.pickVideo(source: source);
    if (pickedFile == null) return null;
    return io.File(pickedFile.path);
  }
}

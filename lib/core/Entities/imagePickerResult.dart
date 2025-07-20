// ignore_for_file: camel_case_types, file_names

import 'dart:io';
import 'dart:typed_data';

class imagePickerResult {
  File? file;
  Uint8List? bytes;
  final String fileName;
  imagePickerResult({this.file, this.bytes, required this.fileName});
}

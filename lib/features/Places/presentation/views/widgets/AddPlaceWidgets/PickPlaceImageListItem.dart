import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/DisplayImagePlaceListItem.dart';

class PickPlaceImageListItem extends StatefulWidget {
  PickPlaceImageListItem({super.key, required this.image});
  dynamic image;
  @override
  State<PickPlaceImageListItem> createState() => _PickPlaceImageListItemState();
}

class _PickPlaceImageListItemState extends State<PickPlaceImageListItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.image != null) {
      if (widget.image is String) {
        return DisplayImagePlaceListItem(url: widget.image);
      } else if (widget.image is ImagePickerResult) {
        if ((widget.image as ImagePickerResult).bytes != null &&
            (widget.image as ImagePickerResult).bytes!.isNotEmpty) {
          List<Uint8List> bytes = (widget.image as ImagePickerResult).bytes!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                DisplayImagePlaceListItem(bytes: bytes[index]),
            itemCount: bytes.length,
            scrollDirection: Axis.horizontal,
          );
        } else if ((widget.image as ImagePickerResult).files != null &&
            (widget.image as ImagePickerResult).files!.isNotEmpty) {
          List<File> files = (widget.image as ImagePickerResult).files!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>
                DisplayImagePlaceListItem(file: files[index]),
            itemCount: files.length,
            scrollDirection: Axis.horizontal,
          );
        } else {
          return DisplayImagePlaceListItem();
        }
      } else {
        return Center(
          child: Icon(Icons.question_mark, color: Colors.orange.shade600),
        );
      }
    } else {
      return Center(child: Icon(Icons.error, color: Colors.red));
    }
  }
}

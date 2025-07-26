import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DisplayImagePlaceListItem extends StatelessWidget {
  DisplayImagePlaceListItem({super.key, this.url, this.file, this.bytes});
  String? url;
  File? file;
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is PlacesPickPlaceImagesLoading,
          child: AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTap: () {
                context.read<PlacesCubit>().pickPlaceImages();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: buildImage(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildImage() {
    if (url != null) {
      return CustomCachedNetworkImage(imageUrl: url!);
    } else if (file != null) {
      return Image.file(file!, fit: BoxFit.cover);
    } else if (bytes != null) {
      return Image.memory(bytes!, fit: BoxFit.cover);
    } else {
      return Center(child: Icon(Icons.photo_camera, color: Colors.black));
    }
  }
}

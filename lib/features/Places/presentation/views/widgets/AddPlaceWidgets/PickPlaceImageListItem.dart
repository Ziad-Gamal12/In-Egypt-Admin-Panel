import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PickPlaceImageListItem extends StatefulWidget {
  PickPlaceImageListItem({super.key, required this.imageUrl});
  String imageUrl;
  @override
  State<PickPlaceImageListItem> createState() => _PickPlaceImageListItemState();
}

class _PickPlaceImageListItemState extends State<PickPlaceImageListItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is PlacesUploadPlaceImageLoading,
          child: AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTap: () {
                context.read<PlacesCubit>().uploadPlaceImage();
              },
              child: getChild(imageUrl: widget.imageUrl),
            ),
          ),
        );
      },
    );
  }

  Widget getChild({required String imageUrl}) {
    if (imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomCachedNetworkImage(
          imageUrl: imageUrl,
          boxFit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Center(
          child: Icon(Icons.add_a_photo_outlined, color: Colors.black),
        ),
      );
    }
  }
}

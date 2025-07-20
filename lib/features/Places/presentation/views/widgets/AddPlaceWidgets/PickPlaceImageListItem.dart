import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PickPlaceImageListItem extends StatefulWidget {
  const PickPlaceImageListItem({
    super.key,
    required this.imageUrl,
    required this.index,
  });
  final String imageUrl;
  final int index;
  @override
  State<PickPlaceImageListItem> createState() => _PickPlaceImageListItemState();
}

class _PickPlaceImageListItemState extends State<PickPlaceImageListItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesUploadPlaceImageSuccess) {
          context.read<PlaceEntity>().images[widget.index] = state.url;
        } else if (state is PlacesUploadPlaceImageFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      builder: (context, state) => AspectRatio(
        aspectRatio: 1,
        child: Skeletonizer(
          enabled: state is PlacesUploadPlaceImageLoading,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: state is PlacesUploadPlaceImageSuccess
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomCachedNetworkImage(imageUrl: state.url),
                  )
                : Icon(Icons.add_a_photo_outlined, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

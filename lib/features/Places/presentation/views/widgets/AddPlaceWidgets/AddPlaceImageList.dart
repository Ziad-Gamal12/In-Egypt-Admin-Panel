import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/PickPlaceImageListItem.dart';

class AddPlaceImageList extends StatefulWidget {
  const AddPlaceImageList({super.key});

  @override
  State<AddPlaceImageList> createState() => _AddPlaceImageListState();
}

class _AddPlaceImageListState extends State<AddPlaceImageList> {
  @override
  Widget build(BuildContext context) {
    List placeImages = context.read<List>();
    return BlocListener<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesPickPlaceImagesSuccess) {
          placeImages.add(state.result);
          setState(() {});
        } else if (state is PlacesPickPlaceImagesFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PickPlaceImageListItem(image: placeImages[index]);
          },
          itemCount: placeImages.length,
        ),
      ),
    );
  }
}

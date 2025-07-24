import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
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
  List<String> images = [''];
  @override
  void initState() {
    if (context.read<PlaceEntity>().images.isNotEmpty) {
      images.addAll(context.read<PlaceEntity>().images);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesUploadPlaceImageSuccess) {
          images.add(state.url);
          context.read<PlaceEntity>().images.add(state.url);
          setState(() {});
        } else if (state is PlacesUploadPlaceImageFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .2,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == images.length - 1 ? 0 : 10,
              ),
              child: PickPlaceImageListItem(imageUrl: images[index]),
            );
          },
          itemCount: images.length,
        ),
      ),
    );
  }
}

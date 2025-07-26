import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';

class CustomPlaceDetailsItemImage extends StatefulWidget {
  const CustomPlaceDetailsItemImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<CustomPlaceDetailsItemImage> createState() =>
      _CustomPlaceDetailsItemImageState();
}

class _CustomPlaceDetailsItemImageState
    extends State<CustomPlaceDetailsItemImage> {
  @override
  void initState() {
    context.read<PlacesCubit>().selectPlaceMainImage(url: widget.imageUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PlacesCubit, PlacesState, String>(
      selector: (state) {
        if (state is PlacesSelectPlaceMainImageSuccess) {
          return state.imageUrl;
        }
        return widget.imageUrl;
      },
      builder: (context, state) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: CustomCachedNetworkImage(
            imageUrl: state,
            boxFit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}

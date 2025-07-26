import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';

class CustomPlaceImage extends StatelessWidget {
  const CustomPlaceImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            border:
                (state is PlacesSelectPlaceMainImageSuccess &&
                    state.imageUrl == imageUrl)
                ? Border.all(color: kMainColor, width: 2)
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomCachedNetworkImage(imageUrl: imageUrl),
          ),
        );
      },
    );
  }
}

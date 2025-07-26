import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/AboutPlaceSection.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsActionButtons.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsItemImage.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceMap.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceTitleAndRatingAndLocation.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceImagesSection.dart';

class PlaceDetailsViewBodyContent extends StatelessWidget {
  const PlaceDetailsViewBodyContent({super.key, required this.place});

  final PlaceEntity place;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesDeletePlaceSuccess) {
          Navigator.pop(context);
        } else if (state is PlacesDeletePlaceFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF3F3F3), width: 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kVerticalPadding,
            horizontal: kHorizentalPadding,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 120),
                      width: double.infinity,
                      height: 2,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: CustomPlaceDetailsItemImage(
                        imageUrl: place.images[0],
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomPlaceTitleAndRatingAndLocation(place: place),
                    SizedBox(height: 16),
                    AboutPlaceSection(description: place.description),
                    SizedBox(height: 20),
                    PlaceImagesSection(imagesURLS: place.images),
                    SizedBox(height: 20),

                    CustomPlaceMap(
                      latitude: place.latitude,
                      longitude: place.longitude,
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: CustomPlaceDetailsActionButtons(place: place),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

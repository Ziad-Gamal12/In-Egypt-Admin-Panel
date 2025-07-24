import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/AddPlaceBody.dart';

class CustomPlaceDetailsActionButtons extends StatelessWidget {
  const CustomPlaceDetailsActionButtons({super.key, required this.place});
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custombutton(
          text: "تعديل البيانات",
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (_) {
                return AddAndEditPlaceBody(place: place, isEdit: true);
              },
            );
          },
        ),
        SizedBox(height: 10),
        BlocBuilder<PlacesCubit, PlacesState>(
          builder: (context, state) {
            return state is PlacesDeletePlaceLoading
                ? CircularProgressIndicator()
                : Custombutton(
                    text: "حذف المكان",
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<PlacesCubit>().deletePlace(
                        placeId: place.id,
                      );
                    },
                  );
          },
        ),
      ],
    );
  }
}

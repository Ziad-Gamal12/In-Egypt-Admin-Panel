import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/FilterPlacesEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/filter_places_cubit/filter_places_cubit.dart';

class FilterAndSortPlacesBottomSheetBodyButton extends StatelessWidget {
  const FilterAndSortPlacesBottomSheetBodyButton({
    super.key,
    required this.filterPlacesEntity,
    required this.clearPlaces,
  });

  final FilterPlacesEntity filterPlacesEntity;
  final ValueChanged<List<PlaceEntity>> clearPlaces;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Custombutton(
            text: "تطبيق",
            color: kMainColor,
            textColor: Colors.white,
            onPressed: () {
              context.read<FilterPlacesCubit>().getFilteredPlaces(
                filterPlacesEntity: filterPlacesEntity,
              );
            },
          ),
        ),
        SizedBox(width: 20),
        IconButton(
          onPressed: () {
            clearPlaces([]);
            Navigator.pop(context);
          },
          icon: Icon(Icons.remove_circle_outline, color: Colors.red, size: 40),
        ),
      ],
    );
  }
}

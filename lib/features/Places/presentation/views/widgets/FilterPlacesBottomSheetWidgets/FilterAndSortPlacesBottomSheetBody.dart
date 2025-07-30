import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomFillterPlacesHeader.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/FilterPlacesEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/filter_places_cubit/filter_places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesCategorySelection.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesPriceSlider.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesRatingRadioButtons.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/FilterAndSortPlacesBottomSheetBodyButton.dart';

class FilterAndSortPlacesBottomSheetBody extends StatefulWidget {
  const FilterAndSortPlacesBottomSheetBody({
    super.key,
    required this.onPlacesChanged,
  });
  final ValueChanged<List<PlaceEntity>> onPlacesChanged;
  @override
  State<FilterAndSortPlacesBottomSheetBody> createState() =>
      _FilterAndSortPlacesBottomSheetBodyState();
}

class _FilterAndSortPlacesBottomSheetBodyState
    extends State<FilterAndSortPlacesBottomSheetBody> {
  double? maxPrice;
  String? selectedCategory;
  bool? isRatingDescending;
  late FilterPlacesEntity filterPlacesEntity;
  @override
  void initState() {
    super.initState();
    filterPlacesEntity = FilterPlacesEntity(
      maxPrice: maxPrice,
      category: selectedCategory,
      isRatingDescending: isRatingDescending,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilterPlacesCubit, FilterPlacesState>(
      listener: (context, state) {
        if (state is GetFilteredPlacesSuccess && state.places.isNotEmpty) {
          widget.onPlacesChanged(state.places);
          Navigator.pop(context);
        } else if (state is GetFilteredPlacesSuccess && state.places.isEmpty) {
          ShowSnackBar(
            context: context,
            borderColor: Colors.blue,
            child: Text(
              "لا يوجد أماكن مطابقة للبحث",
              style: AppTextStyles(
                context,
              ).regular14.copyWith(color: Colors.black),
            ),
            backgroundColor: Colors.blue.shade300,
          );
        } else if (state is GetFilteredPlacesFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFillterAndSortHeader(),
              const SizedBox(height: 10),
              CustomFillterPlacesCategorySelection(
                onCategoryChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                  filterPlacesEntity.category = value;
                },
              ),
              CustomFillterPlacesPriceSlider(
                maxPrice: maxPrice ?? 0,
                onChanged: (value) {
                  setState(() {
                    maxPrice = value;
                  });
                  filterPlacesEntity.maxPrice = value;
                },
              ),

              SizedBox(height: 20),
              CustomFillterPlacesRatingRadioButtons(
                ratingIsDescending: (isDescending) {
                  setState(() {
                    isRatingDescending = isDescending;
                  });
                  filterPlacesEntity.isRatingDescending = isDescending;
                },
              ),
              SizedBox(height: 40),
              FilterAndSortPlacesBottomSheetBodyButton(
                filterPlacesEntity: filterPlacesEntity,
                clearPlaces: widget.onPlacesChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

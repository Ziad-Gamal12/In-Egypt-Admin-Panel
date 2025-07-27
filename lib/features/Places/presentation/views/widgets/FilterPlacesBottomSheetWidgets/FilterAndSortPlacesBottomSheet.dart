import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesCategorySelection.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesHeader.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesPriceSlider.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesRatingRadioButtons.dart';

class FilterAndSortPlacesBottomSheet extends StatefulWidget {
  const FilterAndSortPlacesBottomSheet({super.key});

  @override
  State<FilterAndSortPlacesBottomSheet> createState() =>
      _FilterAndSortPlacesBottomSheetState();
}

class _FilterAndSortPlacesBottomSheetState
    extends State<FilterAndSortPlacesBottomSheet> {
  double? maxPrice;
  String? selectedCategory;
  bool? isRatingDescending;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFillterPlacesHeader(),
            const SizedBox(height: 10),
            CustomFillterPlacesCategorySelection(
              onCategoryChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            CustomFillterPlacesPriceSlider(
              maxPrice: maxPrice ?? 0,
              onChanged: (value) => setState(() => maxPrice = value),
            ),
            SizedBox(height: 20),
            CustomFillterPlacesRatingRadioButtons(
              ratingIsDescending: (isDescending) {
                setState(() {
                  isRatingDescending = isDescending;
                });
              },
            ),
            SizedBox(height: 40),
            Custombutton(
              text: "تطبيق",
              color: kMainColor,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

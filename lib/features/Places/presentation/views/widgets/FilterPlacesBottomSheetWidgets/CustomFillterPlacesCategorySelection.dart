import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/FilterPlacesBottomSheetWidgets/CustomFillterPlacesCategoriesList.dart';

class CustomFillterPlacesCategorySelection extends StatelessWidget {
  const CustomFillterPlacesCategorySelection({
    super.key,
    required this.onCategoryChanged,
  });
  final ValueChanged<String> onCategoryChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الفئة",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        SizedBox(height: 10),
        CustomFillterPlacesCategoriesList(onCategoryChanged: onCategoryChanged),
      ],
    );
  }
}

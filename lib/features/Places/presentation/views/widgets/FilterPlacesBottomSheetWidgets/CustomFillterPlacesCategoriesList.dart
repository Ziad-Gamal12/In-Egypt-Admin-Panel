import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/SelectPlaceCategoryEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/SelectPlaceCategoryItem.dart';

class CustomFillterPlacesCategoriesList extends StatefulWidget {
  const CustomFillterPlacesCategoriesList({
    super.key,
    required this.onCategoryChanged,
  });
  final ValueChanged<String> onCategoryChanged;
  @override
  State<CustomFillterPlacesCategoriesList> createState() =>
      _CustomFillterPlacesCategoriesListState();
}

class _CustomFillterPlacesCategoriesListState
    extends State<CustomFillterPlacesCategoriesList> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SelectPlaceCategoryEntity.placeCategories
            .asMap()
            .entries
            .map(
              (e) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = e.key;
                    });
                    widget.onCategoryChanged(e.value.enTitle);
                  },
                  child: SelectPlaceCategoryItem(
                    e: e,
                    isSelect: selectedIndex == e.key,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/SelectPlaceCategoryEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/SelectPlaceCategoryItem.dart';
import 'package:provider/provider.dart';

class SelectPlaceCategoryList extends StatefulWidget {
  const SelectPlaceCategoryList({super.key});

  @override
  State<SelectPlaceCategoryList> createState() =>
      _SelectPlaceCategoryListState();
}

class _SelectPlaceCategoryListState extends State<SelectPlaceCategoryList> {
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
                    context.read<PlaceEntity>().category = e.value.enTitle;
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

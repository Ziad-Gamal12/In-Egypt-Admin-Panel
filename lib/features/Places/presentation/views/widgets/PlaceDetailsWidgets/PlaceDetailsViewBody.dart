import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceItemInfo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/AboutPlaceSection.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomFlutterMap.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsActionButtons.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsItemImage.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceImagesSection.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kVerticalPadding,
        horizontal: kHorizentalPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomPlaceDetailsItemImage(),
                CustomPlaceItemInfo(titleColor: Colors.black),
                SizedBox(height: 16),
                AboutPlaceSection(),
                SizedBox(height: 20),
                PlaceImagesSection(),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kMainColor, width: 1),
                  ),
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CustomFlutterMap(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          SliverToBoxAdapter(child: CustomPlaceDetailsActionButtons()),
        ],
      ),
    );
  }
}

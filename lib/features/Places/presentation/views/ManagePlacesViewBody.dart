import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomAddPlaceButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesHeader.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesSliverGrid.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomSearchAndFilterPlacesWidget.dart';

class ManagePlacesViewBody extends StatelessWidget {
  const ManagePlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),

      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSearchAndFilterPlacesWidget(),
                      SizedBox(height: 20),
                      CustomPlacesHeader(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                CustomPlacesSliverGrid(maxWidth: constraints.maxWidth),
              ],
            ),
          ),
          Positioned(left: 16, bottom: 16, child: CustomAddPlaceButton()),
        ],
      ),
    );
  }
}

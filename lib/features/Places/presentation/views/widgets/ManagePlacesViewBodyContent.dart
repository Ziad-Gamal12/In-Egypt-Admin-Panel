import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomSearchAndFilterWidget.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomAddPlaceButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesHeader.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/CustomPlacesSliverGrid.dart';

class ManagePlacesViewBodyContent extends StatelessWidget {
  const ManagePlacesViewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSearchAndFilterWidget(),
                    SizedBox(height: 20),
                    CustomPlacesHeader(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              CustomPlacesSliverGrid(maxWidth: constraints.maxWidth),
            ],
          ),
          Positioned(left: 16, bottom: 16, child: CustomAddPlaceButton()),
        ],
      ),
    );
  }
}

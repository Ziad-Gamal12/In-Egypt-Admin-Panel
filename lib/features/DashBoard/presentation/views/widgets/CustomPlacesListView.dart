import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomBottomSheetUpperDivider.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceVerticalDesignItem.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';

class CustomPlacesListView extends StatelessWidget {
  const CustomPlacesListView({super.key, required this.places});
  final List<PlaceEntity> places;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: places.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AspectRatio(
            aspectRatio: 1 / 1.5,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  useRootNavigator: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (_) {
                    return Column(
                      children: [
                        const SizedBox(height: 16),
                        CustomBottomSheetUpperDivider(),
                        SizedBox(height: 16),
                        Expanded(
                          child: PlaceDetailsViewBody(place: places[index]),
                        ),
                      ],
                    );
                  },
                );
              },
              child: CustomPlaceVerticalDesignItem(place: places[index]),
            ),
          ),
        );
      },
    );
  }
}

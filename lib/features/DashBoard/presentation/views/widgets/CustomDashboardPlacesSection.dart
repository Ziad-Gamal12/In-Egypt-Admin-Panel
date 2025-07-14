import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardCard.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/PlacesTable.dart';

class CustomDashBoardPlacesSection extends StatelessWidget {
  const CustomDashBoardPlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Customdashboardcard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDashBoardPlacesSectionHeader(),
          SizedBox(height: 20),
          Expanded(child: PlacesTabel()),
        ],
      ),
    );
  }
}

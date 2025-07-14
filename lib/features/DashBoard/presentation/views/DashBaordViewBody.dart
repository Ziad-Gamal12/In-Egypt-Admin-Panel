import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardCard.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardInfoRow.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardBookingsSection.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardPlacesSection.dart';

class DashBaordViewBody extends StatelessWidget {
  const DashBaordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: Column(
        children: [
          CustomDashBoardInfoRow(),
          Divider(height: 40, color: Colors.grey.shade400),
          Expanded(
            child: Customdashboardcard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: CustomDashBoardPlacesSection()),
                  const SizedBox(width: 20),
                  Expanded(child: CustomDashBoardBookingsSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

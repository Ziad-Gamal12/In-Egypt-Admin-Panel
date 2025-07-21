import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardDesktopLayout/BookingsTabel.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardDesktopLayout/PlacesTable.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardCard.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardInfoRow.dart';

class Dashboarddesktoplayout extends StatefulWidget {
  const Dashboarddesktoplayout({super.key});

  @override
  State<Dashboarddesktoplayout> createState() => _DashboarddesktoplayoutState();
}

class _DashboarddesktoplayoutState extends State<Dashboarddesktoplayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDashBoardInfoRow(),
        Divider(height: 40, color: Colors.grey.shade400),
        Expanded(
          child: Customdashboardcard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" الاحصائيات:", style: AppTextStyles(context).bold24),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: PlacesTabel()),
                      const SizedBox(width: 20),
                      Expanded(child: BookingsTabel()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

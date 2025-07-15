import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardDesktopLayout/DashboardDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardMobileAndTabletLayout/DashboardMobileAndTabletLayout.dart';

class DashBaordViewBody extends StatelessWidget {
  const DashBaordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return getDashboardlayoutDesign(
            maxWidth: constraints.maxWidth,
            context: context,
          );
        },
      ),
    );
  }

  Widget getDashboardlayoutDesign({
    required double maxWidth,
    required BuildContext context,
  }) {
    if (maxWidth <= 715 || MediaQuery.of(context).size.width < 907) {
      return Dashboardmobileandtabletlayout();
    } else {
      return Dashboarddesktoplayout();
    }
  }
}

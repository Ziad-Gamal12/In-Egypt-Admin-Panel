import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/DashboardItemInfoStatColumn.dart';

class DashboardItemInfoStatsRow extends StatelessWidget {
  const DashboardItemInfoStatsRow({
    super.key,
    required this.total,
    required this.current,
    required this.previous,
  });

  final int total;
  final int current;
  final int previous;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DashboardItemInfoStatColumn(
          iconPath: Assets.assetsIconsTotalIcon,
          label: "المجموع",
          value: total,
        ),
        const SizedBox(width: 10),
        DashboardItemInfoStatColumn(
          iconPath: Assets.assetsIconsUpArrow,
          label: "اليوم",
          value: current,
        ),
        const SizedBox(width: 10),
        DashboardItemInfoStatColumn(
          iconPath: Assets.assetsIconsDownArrow,
          label: "البارحه",
          value: previous,
        ),
      ],
    );
  }
}

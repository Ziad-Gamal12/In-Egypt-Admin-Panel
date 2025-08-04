import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/DashboardItemInfoStatsRow.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/DashboardItemInfoTopIcon.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/DashboardItemInfoTrendIcon.dart';

class DashboardItemInfoCard extends StatelessWidget {
  const DashboardItemInfoCard({
    super.key,
    required this.iconPath,
    required this.current,
    required this.previous,
    required this.trend,
    required this.label,
    required this.total,
  });
  final String label;
  final int current;
  final int previous;
  final int total;
  final String trend;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return CustomScaleAnimatedWidget(
      child: AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade50,
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppTextStyles(
                        context,
                      ).semiBold16.copyWith(color: Colors.black),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: DashboardItemInfoStatsRow(
                              total: total,
                              current: current,
                              previous: previous,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: DashboardItemInfoTrendIcon(trend: trend),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: DashboardItemInfoTopIcon(iconPath: iconPath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

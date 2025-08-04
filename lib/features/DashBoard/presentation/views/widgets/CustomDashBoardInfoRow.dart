import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/DashboardItemInfoCard.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDashBoardInfoRow extends StatelessWidget {
  const CustomDashBoardInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) =>
          current is DashboardGetDashBoardInfoSuccess ||
          current is DashboardGetDashBoardInfoFailure ||
          current is DashboardGetDashBoardInfoLoading,
      builder: (context, state) {
        if (state is DashboardGetDashBoardInfoFailure) {
          return CustomErrorWidget(message: state.errmessage);
        }

        final isLoading = state is DashboardGetDashBoardInfoLoading;
        final info = state is DashboardGetDashBoardInfoSuccess
            ? state.dashBoardInfoEntity.data
            : null;

        return Skeletonizer(
          enabled: isLoading,
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  DashboardItemInfoCard(
                    label: "الأماكن",
                    current: info?.places.current ?? 0,
                    total: info?.places.total ?? 0,
                    previous: info?.places.previous ?? 0,
                    trend: info?.places.trend ?? "equal",
                    iconPath: Assets.assetsIconsPlacesIcon,
                  ),
                  const SizedBox(width: 16),
                  DashboardItemInfoCard(
                    label: "المستخدمين",
                    iconPath: Assets.assetsIconsUsersIcon,
                    current: info?.users.current ?? 0,
                    total: info?.users.total ?? 0,
                    previous: info?.users.previous ?? 0,
                    trend: info?.users.trend ?? "equal",
                  ),
                  const SizedBox(width: 16),
                  DashboardItemInfoCard(
                    label: "الحجوزات",
                    current: info?.bookings.current ?? 0,
                    total: info?.bookings.total ?? 0,
                    previous: info?.bookings.previous ?? 0,
                    trend: info?.bookings.trend ?? "equal",
                    iconPath: Assets.assetsIconsBookingsIcon,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

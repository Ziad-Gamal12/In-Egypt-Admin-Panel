import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardCard.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardInfoItem.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDashBoardInfoRow extends StatelessWidget {
  const CustomDashBoardInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (state is DashboardGetDashBoardInfoFailure) {
          return CustomErrorWidget(message: state.errmessage);
        } else if (state is DashboardGetDashBoardInfoSuccess) {
          return Customdashboardcard(
            child: IntrinsicHeight(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomDashboardInfoItem(
                      title: "الاماكن",
                      iconPath: Assets.assetsIconsPlacesIcon,
                      number: state.dashBoardInfoEntity.totalPlacesCount
                          .toString(),
                    ),
                    CustomDashboardInfoItem(
                      title: "المسؤولين",
                      iconPath: Assets.assetsIconsUsersIcon,
                      number: state.dashBoardInfoEntity.totalAdminsCount
                          .toString(),
                    ),

                    CustomDashboardInfoItem(
                      title: "المستخدمين",
                      iconPath: Assets.assetsIconsUsersIcon,
                      number: state.dashBoardInfoEntity.totalUsersCount
                          .toString(),
                    ),

                    CustomDashboardInfoItem(
                      title: "الحجوزات",
                      iconPath: Assets.assetsIconsBookingsIcon,
                      number: state.dashBoardInfoEntity.totalBookingsCount
                          .toString(),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: Customdashboardcard(
              child: IntrinsicHeight(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomDashboardInfoItem(
                        title: "الاماكن",
                        iconPath: Assets.assetsIconsPlacesIcon,
                        number: "",
                      ),
                      CustomDashboardInfoItem(
                        title: "المسؤولين",
                        iconPath: Assets.assetsIconsUsersIcon,
                        number: "",
                      ),

                      CustomDashboardInfoItem(
                        title: "المستخدمين",
                        iconPath: Assets.assetsIconsUsersIcon,
                        number: "",
                      ),

                      CustomDashboardInfoItem(
                        title: "الحجوزات",
                        iconPath: Assets.assetsIconsBookingsIcon,
                        number: "",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

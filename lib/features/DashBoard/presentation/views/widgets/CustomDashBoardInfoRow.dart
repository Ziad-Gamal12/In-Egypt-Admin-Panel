import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardCard.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardInfoItem.dart';

class CustomDashBoardInfoRow extends StatelessWidget {
  const CustomDashBoardInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Customdashboardcard(
      child: IntrinsicHeight(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              CustomDashboardInfoItem(
                title: "الاماكن",
                iconPath: Assets.assetsIconsPlacesIcon,
                number: "140",
              ),
              CustomDashboardInfoItem(
                title: "المسؤولين",
                iconPath: Assets.assetsIconsUsersIcon,
                number: "5",
              ),

              CustomDashboardInfoItem(
                title: "المستخدمين",
                iconPath: Assets.assetsIconsUsersIcon,
                number: "1200",
              ),

              CustomDashboardInfoItem(
                title: "الحجوزات",
                iconPath: Assets.assetsIconsBookingsIcon,
                number: "245",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

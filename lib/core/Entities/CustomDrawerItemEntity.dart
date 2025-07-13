import 'package:in_egypt_admin_panel/core/utils/images.dart';

class CustomDrawerItemEntity {
  final String title, iconPath;

  CustomDrawerItemEntity({required this.title, required this.iconPath});
  static List<CustomDrawerItemEntity> toList() {
    return [
      CustomDrawerItemEntity(
        title: "الصفحة الرئيسية",
        iconPath: Assets.assetsIconsHomeIcon,
      ),
      CustomDrawerItemEntity(
        title: "أدارة الأماكن",
        iconPath: Assets.assetsIconsPlacesIcon,
      ),
      CustomDrawerItemEntity(
        title: "الحجوزات",
        iconPath: Assets.assetsIconsBookingsIcon,
      ),
      CustomDrawerItemEntity(
        title: "المستخدمين",
        iconPath: Assets.assetsIconsUsersIcon,
      ),
    ];
  }
}

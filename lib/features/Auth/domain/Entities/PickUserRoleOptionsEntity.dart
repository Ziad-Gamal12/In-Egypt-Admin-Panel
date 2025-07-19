import 'package:in_egypt_admin_panel/core/utils/images.dart';

class PickUserRoleOptionsEntity {
  final String title;
  final String imagePath;
  PickUserRoleOptionsEntity({required this.title, required this.imagePath});

  static List<PickUserRoleOptionsEntity> getOptions() {
    return [
      PickUserRoleOptionsEntity(
        title: "مسؤول عام",
        imagePath: Assets.assetsIconsAdminIcon,
      ),
      PickUserRoleOptionsEntity(
        title: "مسؤول حجوزات",
        imagePath: Assets.assetsIconsBookingsManagerIcon,
      ),
      PickUserRoleOptionsEntity(
        title: "مسؤول الأماكن",
        imagePath: Assets.assetsIconsPlacesManagerIcon,
      ),
    ];
  }
}

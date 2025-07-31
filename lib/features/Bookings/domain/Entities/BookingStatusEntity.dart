import 'package:in_egypt_admin_panel/core/utils/images.dart';

class BookingStatusEntity {
  final String enStatus;
  final String arStatus;
  final String iconPath;

  BookingStatusEntity({
    required this.enStatus,
    required this.arStatus,
    required this.iconPath,
  });

  static List<BookingStatusEntity> statusOptions() {
    return [
      BookingStatusEntity(
        enStatus: "pending",
        arStatus: "قيد الانتظار",
        iconPath: Assets.assetsIconsPending,
      ),
      BookingStatusEntity(
        enStatus: "confirmed",
        arStatus: "موافق",
        iconPath: Assets.assetsIconsSuccess,
      ),
      BookingStatusEntity(
        enStatus: "rejected",
        arStatus: "مرفوض",
        iconPath: Assets.assetsIconsReject,
      ),
      BookingStatusEntity(
        enStatus: "cancelled",
        arStatus: "ملغى",
        iconPath: Assets.assetsIconsCancel,
      ),
    ];
  }
}

import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/CountsEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/DataEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/TotalCountsEntity.dart';

class DashBoardInfoEntity {
  final bool success;
  final DataEntity data;
  final String date;
  final CountsEntity counts;
  final TotalCountsEntity? totalCounts;

  DashBoardInfoEntity({
    required this.success,
    required this.data,
    required this.date,
    required this.counts,
    required this.totalCounts,
  });
}

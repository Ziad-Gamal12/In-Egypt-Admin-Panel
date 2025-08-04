import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/BookingsEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/CountsEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/DataEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/PlacesEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/TotalCountsEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/UsersEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/dash_board_infoEntity.dart';

import 'counts.dart';
import 'data.dart';
import 'total_counts.dart';

class DashBoardInfo {
  bool? success;
  Data? data;
  String? date;
  Counts? counts;
  TotalCounts? totalCounts;

  DashBoardInfo({
    this.success,
    this.data,
    this.date,
    this.counts,
    this.totalCounts,
  });

  factory DashBoardInfo.fromJson(Map<String, dynamic> json) => DashBoardInfo(
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    date: json['date'] as String?,
    counts: json['counts'] == null
        ? null
        : Counts.fromJson(json['counts'] as Map<String, dynamic>),
    totalCounts: json['totalCounts'] == null
        ? null
        : TotalCounts.fromJson(json['totalCounts'] as Map<String, dynamic>),
  );
  DashBoardInfoEntity toEntity() => DashBoardInfoEntity(
    success: success ?? false,
    data:
        data?.toEntity() ??
        DataEntity(
          users: UsersEntity(
            current: 0,
            previous: 0,
            trend: "equal",
            change: 0,
            total: 0,
          ),
          bookings: BookingsEntity(
            current: 0,
            previous: 0,
            trend: "equal",
            change: 0,
            total: 0,
          ),
          places: PlacesEntity(
            current: 0,
            previous: 0,
            trend: "equal",
            change: 0,
            total: 0,
          ),
        ),
    date: date ?? "",
    counts:
        counts?.toEntity() ?? CountsEntity(users: 0, bookings: 0, places: 0),
    totalCounts:
        totalCounts?.toEntity() ??
        TotalCountsEntity(users: 0, bookings: 0, places: 0),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'data': data?.toJson(),
    'date': date,
    'counts': counts?.toJson(),
    'totalCounts': totalCounts?.toJson(),
  };
}

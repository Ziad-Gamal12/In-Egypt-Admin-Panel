import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/BookingsEntity.dart';

class Bookings {
  int? current;
  int? previous;
  String? trend;
  int? change;
  int? total;

  Bookings({this.current, this.previous, this.trend, this.change, this.total});

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
    current: json['current'] as int?,
    previous: json['previous'] as int?,
    trend: json['trend'] as String?,
    change: json['change'] as int?,
    total: json['total'] as int?,
  );
  BookingsEntity toEntity() => BookingsEntity(
    current: current ?? 0,
    previous: previous ?? 0,
    trend: trend ?? "equal",
    change: change ?? 0,
    total: total ?? 0,
  );
  Map<String, dynamic> toJson() => {
    'current': current,
    'previous': previous,
    'trend': trend,
    'change': change,
    'total': total,
  };
}

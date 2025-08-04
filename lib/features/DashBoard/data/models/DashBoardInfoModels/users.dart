import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/UsersEntity.dart';

class Users {
  int? current;
  int? previous;
  String? trend;
  int? change;
  int? total;

  Users({this.current, this.previous, this.trend, this.change, this.total});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    current: json['current'] as int?,
    previous: json['previous'] as int?,
    trend: json['trend'] as String?,
    change: json['change'] as int?,
    total: json['total'] as int?,
  );
  UsersEntity toEntity() => UsersEntity(
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

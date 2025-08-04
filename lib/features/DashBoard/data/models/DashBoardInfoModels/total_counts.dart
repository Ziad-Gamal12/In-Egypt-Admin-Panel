import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/TotalCountsEntity.dart';

class TotalCounts {
  int? users;
  int? bookings;
  int? places;

  TotalCounts({this.users, this.bookings, this.places});

  factory TotalCounts.fromJson(Map<String, dynamic> json) => TotalCounts(
    users: json['users'] as int?,
    bookings: json['bookings'] as int?,
    places: json['places'] as int?,
  );

  TotalCountsEntity toEntity() => TotalCountsEntity(
    users: users ?? 0,
    bookings: bookings ?? 0,
    places: places ?? 0,
  );
  Map<String, dynamic> toJson() => {
    'users': users,
    'bookings': bookings,
    'places': places,
  };
}

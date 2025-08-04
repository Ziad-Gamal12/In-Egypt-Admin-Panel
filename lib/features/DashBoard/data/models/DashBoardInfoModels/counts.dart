import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/CountsEntity.dart';

class Counts {
  int? users;
  int? bookings;
  int? places;

  Counts({this.users, this.bookings, this.places});

  factory Counts.fromJson(Map<String, dynamic> json) => Counts(
    users: json['users'] as int?,
    bookings: json['bookings'] as int?,
    places: json['places'] as int?,
  );
  CountsEntity toEntity() => CountsEntity(
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

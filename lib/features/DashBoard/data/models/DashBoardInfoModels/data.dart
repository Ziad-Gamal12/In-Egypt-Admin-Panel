import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/BookingsEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/DataEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/PlacesEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/UsersEntity.dart';

import 'bookings.dart';
import 'places.dart';
import 'users.dart';

class Data {
  Users? users;
  Bookings? bookings;
  Places? places;

  Data({this.users, this.bookings, this.places});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    users: json['users'] == null
        ? null
        : Users.fromJson(json['users'] as Map<String, dynamic>),
    bookings: json['bookings'] == null
        ? null
        : Bookings.fromJson(json['bookings'] as Map<String, dynamic>),
    places: json['places'] == null
        ? null
        : Places.fromJson(json['places'] as Map<String, dynamic>),
  );
  DataEntity toEntity() => DataEntity(
    users:
        users?.toEntity() ??
        UsersEntity(
          current: 0,
          previous: 0,
          trend: "equal",
          change: 0,
          total: 0,
        ),
    bookings:
        bookings?.toEntity() ??
        BookingsEntity(
          current: 0,
          previous: 0,
          trend: "equal",
          change: 0,
          total: 0,
        ),
    places:
        places?.toEntity() ??
        PlacesEntity(
          current: 0,
          previous: 0,
          trend: "equal",
          change: 0,
          total: 0,
        ),
  );
  Map<String, dynamic> toJson() => {
    'users': users?.toJson(),
    'bookings': bookings?.toJson(),
    'places': places?.toJson(),
  };
}

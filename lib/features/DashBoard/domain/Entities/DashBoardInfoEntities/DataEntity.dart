import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/BookingsEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/PlacesEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntities/UsersEntity.dart';

class DataEntity {
  final UsersEntity users;
  final BookingsEntity bookings;
  final PlacesEntity places;

  DataEntity({
    required this.users,
    required this.bookings,
    required this.places,
  });
}

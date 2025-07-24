import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';

class GetplacesResponseEntity {
  final List<PlaceEntity> places;
  final bool hasMore;

  GetplacesResponseEntity({required this.places, required this.hasMore});
}

import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class BookingEntity {
  final UserEntity user;
  final PlaceEntity place;
  final DateTime startAt;
  final DateTime endAt;
  final DateTime createdAt;
  final double daysDuration;
  final int numberOfGuests;
  final String status;
  final String id;
  final double totalPrice;
  final String paymentMethod;

  BookingEntity({
    required this.user,
    required this.place,
    required this.startAt,
    required this.endAt,
    required this.createdAt,
    required this.daysDuration,
    required this.numberOfGuests,
    required this.status,
    required this.id,
    required this.totalPrice,
    required this.paymentMethod,
  });
}

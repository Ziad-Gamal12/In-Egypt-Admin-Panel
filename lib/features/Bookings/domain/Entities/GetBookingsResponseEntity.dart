import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';

class GetBookingsResponseEntity {
  final List<BookingEntity> bookings;
  final bool hasMore;

  GetBookingsResponseEntity({required this.bookings, required this.hasMore});
}

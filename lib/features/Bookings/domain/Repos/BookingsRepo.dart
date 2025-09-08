import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/FilterBookingsEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/GetBookingsResponseEntity.dart';

abstract class BookingsRepo {
  Future<Either<Failure, GetBookingsResponseEntity>> getBookings({
    required bool isPaginated,
  });
  Future<Either<Failure, GetBookingsResponseEntity>> getSearchedBookings({
    required String searchKey,
    required bool isPaginated,
  });
  Future<Either<Failure, GetBookingsResponseEntity>> getFilteredBookings({
    required FilterBookingsEntity filterBookingsEntity,
  });
  Future<Either<Failure, void>> updateBookingStatus({
    required BookingEntity booking,
  });
  Future<Either<Failure, void>> deleteBooking({required String bookingId});
  Future<Either<Failure, BookingEntity>> getBookingScanedQrCode({
    required String booingId,
  });
}

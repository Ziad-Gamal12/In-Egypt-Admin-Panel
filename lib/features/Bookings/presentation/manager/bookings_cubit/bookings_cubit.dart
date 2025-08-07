import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/GetBookingsResponseEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Repos/BookingsRepo.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit({required this.bookingsRepo}) : super(BookingsInitial());
  final BookingsRepo bookingsRepo;

  Future<void> getBookings({required bool isPaginated}) async {
    emit(BookingsGetBookingsLoading());
    final result = await bookingsRepo.getBookings(isPaginated: isPaginated);
    result.fold(
      (failure) {
        emit(BookingsGetBookingsFailure(errmessage: failure.message));
      },
      (response) {
        emit(BookingsGetBookingsSuccess(response: response));
      },
    );
  }

  Future<void> getSearchedBookings({
    required String searchKey,
    required bool isPaginated,
  }) async {
    emit(BookingsGetSearchBookingsLoading());
    final result = await bookingsRepo.getSearchedBookings(
      searchKey: searchKey,
      isPaginated: isPaginated,
    );
    result.fold(
      (failure) {
        emit(BookingsGetSearchBookingsFailure(errmessage: failure.message));
      },
      (response) {
        emit(BookingsGetSearchBookingsSuccess(response: response));
      },
    );
  }

  void updateBooking({required BookingEntity booking}) async {
    emit(BookingsUpdateBookingLoading());
    final result = await bookingsRepo.updateBookingStatus(booking: booking);
    result.fold(
      (failure) {
        emit(BookingsUpdateBookingFailure(errmessage: failure.message));
      },
      (response) {
        emit(BookingsUpdateBookingSuccess());
      },
    );
  }

  void deleteBooking({required String bookingId}) async {
    emit(BookingsDeleteBookingLoading());
    final result = await bookingsRepo.deleteBooking(bookingId: bookingId);
    result.fold(
      (failure) {
        emit(BookingsDeleteBookingFailure(errmessage: failure.message));
      },
      (response) {
        emit(BookingsDeleteBookingSuccess());
      },
    );
  }
}

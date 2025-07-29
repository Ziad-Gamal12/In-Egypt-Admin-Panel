part of 'bookings_cubit.dart';

sealed class BookingsState {}

final class BookingsInitial extends BookingsState {}

final class BookingsGetBookingsLoading extends BookingsState {}

final class BookingsGetBookingsSuccess extends BookingsState {
  final GetBookingsResponseEntity response;
  BookingsGetBookingsSuccess({required this.response});
}

final class BookingsGetBookingsFailure extends BookingsState {
  final String errmessage;
  BookingsGetBookingsFailure({required this.errmessage});
}

final class BookingsGetSearchBookingsLoading extends BookingsState {}

final class BookingsGetSearchBookingsSuccess extends BookingsState {
  final GetBookingsResponseEntity response;
  BookingsGetSearchBookingsSuccess({required this.response});
}

final class BookingsGetSearchBookingsFailure extends BookingsState {
  final String errmessage;
  BookingsGetSearchBookingsFailure({required this.errmessage});
}

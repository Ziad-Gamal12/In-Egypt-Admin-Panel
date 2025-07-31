part of 'filter_bookings_cubit.dart';

sealed class FilterBookingsState {
  const FilterBookingsState();
}

final class FilterBookingsInitial extends FilterBookingsState {}

final class FilterBookingsStartDateSelected extends FilterBookingsState {
  final DateTime startDate;
  const FilterBookingsStartDateSelected({required this.startDate});
}

final class FilterBookingsEndDateSelected extends FilterBookingsState {
  final DateTime endDate;
  const FilterBookingsEndDateSelected({required this.endDate});
}

// getFilteredBookings
final class FilterBookingsGetFilteredBookingsLoading
    extends FilterBookingsState {}

final class FilterBookingsGetFilteredBookingsSuccess
    extends FilterBookingsState {
  final GetBookingsResponseEntity response;
  const FilterBookingsGetFilteredBookingsSuccess({required this.response});
}

final class FilterBookingsGetFilteredBookingsFailure
    extends FilterBookingsState {
  final String errmessage;
  const FilterBookingsGetFilteredBookingsFailure({required this.errmessage});
}

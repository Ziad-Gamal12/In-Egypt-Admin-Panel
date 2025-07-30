part of 'filter_bookings_cubit.dart';

sealed class FilterBookingsState extends Equatable {
  const FilterBookingsState();

  @override
  List<Object> get props => [];
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

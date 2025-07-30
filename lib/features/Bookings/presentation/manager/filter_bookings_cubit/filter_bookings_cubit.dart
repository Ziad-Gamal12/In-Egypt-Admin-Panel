import 'package:bloc/bloc.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Repos/BookingsRepo.dart';

part 'filter_bookings_state.dart';

class FilterBookingsCubit extends Cubit<FilterBookingsState> {
  FilterBookingsCubit({required this.bookingsRepo})
    : super(FilterBookingsInitial());
  final BookingsRepo bookingsRepo;
  Future<DateTime?> selectDate({required BuildContext context}) async {
    TextStyle customTextStyle = AppTextStyles(
      context,
    ).semiBold16.copyWith(color: Colors.black);
    DateTime? range = await showDatePickerDialog(
      context: context,
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      currentDateTextStyle: customTextStyle,
      enabledCellsTextStyle: customTextStyle,
      leadingDateTextStyle: customTextStyle,

      padding: EdgeInsets.all(16),
      currentDateDecoration: BoxDecoration(
        color: Color(0xffFCD240),
        shape: BoxShape.circle,
      ),

      splashColor: Colors.transparent,
      initialPickerType: PickerType.days,
      slidersColor: Colors.black,
      centerLeadingDate: true,
    );
    if (range != null) {
      return range;
    }
    return null;
  }

  void selectStartDate({required BuildContext context}) {
    selectDate(context: context).then((value) {
      if (value != null) {
        emit(FilterBookingsStartDateSelected(startDate: value));
      }
    });
  }

  void selectEndDate({required BuildContext context}) {
    selectDate(context: context).then((value) {
      if (value != null) {
        emit(FilterBookingsEndDateSelected(endDate: value));
      }
    });
  }
}

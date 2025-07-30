import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/filter_bookings_cubit/filter_bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/SelectDateItem.dart';

class CustomFilterBookingsStartAndEndDatesRow extends StatefulWidget {
  const CustomFilterBookingsStartAndEndDatesRow({super.key});

  @override
  State<CustomFilterBookingsStartAndEndDatesRow> createState() =>
      _CustomFilterBookingsStartAndEndDatesRowState();
}

class _CustomFilterBookingsStartAndEndDatesRowState
    extends State<CustomFilterBookingsStartAndEndDatesRow> {
  DateTime? startDate, endDate;
  @override
  Widget build(BuildContext context) {
    return BlocListener<FilterBookingsCubit, FilterBookingsState>(
      listener: (context, state) {
        if (state is FilterBookingsStartDateSelected) {
          startDate = state.startDate;
          setState(() {});
        } else if (state is FilterBookingsEndDateSelected) {
          endDate = state.endDate;
          setState(() {});
        }
      },
      child: Row(
        children: [
          Expanded(
            child: SelectDateItem(
              onTap: () {
                context.read<FilterBookingsCubit>().selectStartDate(
                  context: context,
                );
              },
              date: startDate == null
                  ? "تاريخ البدء"
                  : "${startDate?.day}/${startDate?.month}/${startDate?.year}",
              color: startDate == null ? Colors.grey : Colors.black,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: SelectDateItem(
              onTap: () {
                context.read<FilterBookingsCubit>().selectEndDate(
                  context: context,
                );
              },
              date: endDate == null
                  ? "تاريخ الانتهاء"
                  : "${endDate?.day}/${endDate?.month}/${endDate?.year}",
              color: endDate == null ? Colors.grey : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

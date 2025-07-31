import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomFilterButtons.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/FilterBookingsEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/filter_bookings_cubit/filter_bookings_cubit.dart';

class FilterBookingsBottomSheetBodyButton extends StatefulWidget {
  const FilterBookingsBottomSheetBodyButton({
    super.key,
    required this.filterBookingsEntity,
    required this.formKey,
    required this.onResetFilter,
  });
  final FilterBookingsEntity filterBookingsEntity;
  final GlobalKey<FormState> formKey;
  final VoidCallback onResetFilter;
  @override
  State<FilterBookingsBottomSheetBodyButton> createState() =>
      _FilterBookingsBottomSheetBodyButtonState();
}

class _FilterBookingsBottomSheetBodyButtonState
    extends State<FilterBookingsBottomSheetBodyButton> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<FilterBookingsCubit, FilterBookingsState, bool>(
      selector: (state) => state is FilterBookingsGetFilteredBookingsLoading,
      builder: (context, state) {
        if (state == true) {
          return Center(child: CircularProgressIndicator(color: kMainColor));
        } else {
          return CustomFilterButtons(
            onApply: () {
              if (widget.formKey.currentState!.validate()) {
                widget.formKey.currentState!.save();
              }
              context.read<FilterBookingsCubit>().getFilteredBookings(
                filterBookingsEntity: widget.filterBookingsEntity,
              );
            },
            onReset: () {
              widget.onResetFilter();
            },
          );
        }
      },
    );
  }
}

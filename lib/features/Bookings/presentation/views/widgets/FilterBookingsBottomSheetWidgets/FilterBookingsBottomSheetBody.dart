import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomFillterPlacesHeader.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomTeaxtField.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/FilterBookingsEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/filter_bookings_cubit/filter_bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/CustomFilterBookingSortingRadioButtons.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/CustomFilterBookingsStartAndEndDatesRow.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsBottomSheetBodyButton.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsStatusSection.dart';

class FilterBookingsBottomSheetBody extends StatefulWidget {
  const FilterBookingsBottomSheetBody({
    super.key,
    required this.onBookingsChanged,
  });

  final ValueChanged<List<BookingEntity>> onBookingsChanged;

  @override
  State<FilterBookingsBottomSheetBody> createState() =>
      _FilterBookingsBottomSheetBodyState();
}

class _FilterBookingsBottomSheetBodyState
    extends State<FilterBookingsBottomSheetBody> {
  final FilterBookingsEntity _filter = FilterBookingsEntity();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterBookingsCubit, FilterBookingsState>(
      listener: _handleFilterBookingsStates,
      builder: (context, state) {
        return IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomFillterAndSortHeader(),
                  const SizedBox(height: 20),
                  FilterBookingsStatusSection(
                    onStatusSelected: (val) {
                      _filter.status = val.enStatus;
                    },
                  ),
                  const SizedBox(height: 20),
                  Customteaxtfield(
                    labelText: "الرقم التعريفي",
                    obscureText: false,
                    textInputType: TextInputType.text,
                    validator: (val) => null, // add actual validation if needed
                    onSaved: (val) =>
                        _filter.bookingID = val == "" ? null : val,
                  ),
                  const SizedBox(height: 20),
                  CustomFilterBookingsStartAndEndDatesRow(
                    startDate: (val) => _filter.startDate = val,
                    endDate: (val) => _filter.endDate = val,
                  ),
                  const SizedBox(height: 20),
                  CustomFilterBookingSortingRadioButtons(
                    isCreatedAtDescending: (val) =>
                        _filter.isCreatedAtDescending = val,
                  ),
                  const SizedBox(height: 40),
                  FilterBookingsBottomSheetBodyButton(
                    filterBookingsEntity: _filter,
                    formKey: _formKey,
                    onResetFilter: _onResetFilter,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleFilterBookingsStates(
    BuildContext context,
    FilterBookingsState state,
  ) {
    if (state is FilterBookingsGetFilteredBookingsSuccess) {
      widget.onBookingsChanged(state.response.bookings);
      Navigator.pop(context);
      if (state.response.bookings.isEmpty) {
        ShowSnackBar(
          context: context,
          borderColor: Colors.blue,
          backgroundColor: Colors.blue.shade300,
          child: Text(
            "لا يوجد حجوزات مطابقة للبحث",
            style: AppTextStyles(
              context,
            ).regular14.copyWith(color: Colors.black),
          ),
        );
      }
    } else if (state is FilterBookingsGetFilteredBookingsFailure) {
      showErrorSnackBar(context: context, message: state.errmessage);
    }
  }

  void _onResetFilter() {
    setState(() {
      _filter.bookingID = null;
      _filter.startDate = null;
      _filter.endDate = null;
      _filter.isCreatedAtDescending = null;
      _filter.status = null;
    });
    widget.onBookingsChanged([]);
    GoRouter.of(context).pop();
  }
}

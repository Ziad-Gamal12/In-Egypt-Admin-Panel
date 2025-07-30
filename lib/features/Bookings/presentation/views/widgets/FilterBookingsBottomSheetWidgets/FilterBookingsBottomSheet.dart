import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Repos/BookingsRepo.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/filter_bookings_cubit/filter_bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsBottomSheetBody.dart';

class FilterBookingsBottomSheet extends StatelessWidget {
  const FilterBookingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterBookingsCubit(bookingsRepo: getIt<BookingsRepo>()),
      child: Builder(
        builder: (context) {
          return FilterBookingsBottomSheetBody();
        },
      ),
    );
  }
}

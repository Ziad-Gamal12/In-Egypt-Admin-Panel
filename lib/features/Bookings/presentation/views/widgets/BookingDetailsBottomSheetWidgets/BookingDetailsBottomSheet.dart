import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Repos/BookingsRepo.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/bookings_cubit/bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/BookingDetailsBottomSheetBody.dart';

class BookingDetailsBottomSheet extends StatelessWidget {
  const BookingDetailsBottomSheet({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingsCubit(bookingsRepo: getIt<BookingsRepo>()),
      child: BookingDetailsBottomSheetBody(bookingEntity: bookingEntity),
    );
  }
}

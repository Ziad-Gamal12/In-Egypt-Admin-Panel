import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/bookings_cubit/bookings_cubit.dart';

class CustomBookingDetailsButtons extends StatelessWidget {
  const CustomBookingDetailsButtons({
    super.key,
    required this.selectedStatus,
    required this.bookingEntity,
  });
  final String selectedStatus;
  final BookingEntity bookingEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsCubit, BookingsState>(
      builder: (context, state) {
        if (state is BookingsUpdateBookingLoading ||
            state is BookingsDeleteBookingLoading) {
          return const Center(
            child: CircularProgressIndicator(color: kMainColor),
          );
        } else {
          return Column(
            children: [
              Visibility(
                visible: selectedStatus != bookingEntity.status,
                replacement: SizedBox(),
                child: Custombutton(
                  text: "تحديث حالة الحجز",
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    bookingEntity.status = selectedStatus;
                    context.read<BookingsCubit>().updateBooking(
                      booking: bookingEntity,
                    );
                  },
                ).animate().fadeIn(duration: 500.ms),
              ),
              const SizedBox(height: 10),
              Custombutton(
                text: "حذف الحجز",
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  context.read<BookingsCubit>().deleteBooking(
                    bookingId: bookingEntity.id,
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}

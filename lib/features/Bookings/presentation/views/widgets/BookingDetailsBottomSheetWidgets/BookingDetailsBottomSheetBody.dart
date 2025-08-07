import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/helpers/getUserData.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/_BookingUserInfo.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomBottomSheetUpperDivider.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/BookingStatusEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/bookings_cubit/bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/CustomBookingDetailsButtons.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/CustomBookingDetailsInfoSection.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/CustomBookingPlaceInfo.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/CustomBookingStatusSection.dart';

class BookingDetailsBottomSheetBody extends StatefulWidget {
  const BookingDetailsBottomSheetBody({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;

  @override
  State<BookingDetailsBottomSheetBody> createState() =>
      _BookingDetailsBottomSheetBodyState();
}

class _BookingDetailsBottomSheetBodyState
    extends State<BookingDetailsBottomSheetBody> {
  String bookingStatus = "";
  @override
  void initState() {
    bookingStatus = widget.bookingEntity.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingsCubit, BookingsState>(
      listener: (context, state) {
        if (state is BookingsUpdateBookingSuccess) {
          Navigator.pop(context);
          showSuccessSnackBar(context: context, message: "تم تعديل الحجز");
        } else if (state is BookingsUpdateBookingFailure) {
          Navigator.pop(context);

          showErrorSnackBar(context: context, message: state.errmessage);
        } else if (state is BookingsDeleteBookingSuccess) {
          Navigator.pop(context);

          showSuccessSnackBar(context: context, message: "تم حذف الحجز");
        } else if (state is BookingsDeleteBookingFailure) {
          Navigator.pop(context);

          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kVerticalPadding,
          horizontal: kHorizentalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomBottomSheetUpperDivider(),
              const SizedBox(height: 20),
              CustomScaleAnimatedWidget(
                child: BookingUserInfo(userEntity: widget.bookingEntity.user),
              ),
              Divider(height: 1, color: Colors.grey.shade200),
              const SizedBox(height: 20),
              CustomBookingPlaceInfo(bookingEntity: widget.bookingEntity),
              const SizedBox(height: 10),
              Divider(height: 1, color: Colors.grey.shade200),
              const SizedBox(height: 20),
              CustomBookingDetailsInfoSection(
                bookingEntity: widget.bookingEntity,
              ),
              const SizedBox(height: 10),
              Divider(height: 1, color: Colors.grey.shade200),
              const SizedBox(height: 20),
              IgnorePointer(
                ignoring: haveAccess() == false,
                child: CustomBookingStatusSection(
                  bookingstatusentity: BookingStatusEntity.statusOptions()
                      .firstWhere(
                        (element) => element.enStatus == bookingStatus,
                      ),
                  onStatusSelected: (val) =>
                      setState(() => bookingStatus = val.enStatus),
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: haveAccess(),
                child: CustomBookingDetailsButtons(
                  selectedStatus: bookingStatus,
                  bookingEntity: widget.bookingEntity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool haveAccess() {
    UserEntity user = getUserData();
    if (user.role == Backendkeys.adminRole ||
        user.role == Backendkeys.bookingsManagerRole) {
      return true;
    } else {
      return false;
    }
  }
}

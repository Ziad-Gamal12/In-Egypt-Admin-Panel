import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/filter_bookings_cubit/filter_bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/BookingDetailsBottomSheet.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPageBody extends StatelessWidget {
  const QRScannerPageBody({super.key, required this.scannerController});

  final MobileScannerController scannerController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterBookingsCubit, FilterBookingsState>(
      listener: (context, state) {
        if (state is FilterBookingsGetBookingByScanQrCodeSuccess) {
          scannerController.stop();
          GoRouter.of(context).pop();
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            builder: (_) =>
                BookingDetailsBottomSheet(bookingEntity: state.booking),
          );
        } else if (state is FilterBookingsGetBookingByScanQrCodeFailure) {
          scannerController.stop();
          GoRouter.of(context).pop();
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      builder: (context, state) {
        if (state is FilterBookingsGetBookingByScanQrCodeLoading) {
          return Center(child: CircularProgressIndicator(color: kMainColor));
        }
        return MobileScanner(
          controller: scannerController,
          onDetect: (capture) {
            for (final barcode in capture.barcodes) {
              if (barcode.rawValue != null) {
                scannerController.stop();
                context
                    .read<FilterBookingsCubit>()
                    .filterBookingsGetBookingByScanQrCode(
                      bookingId: barcode.rawValue!,
                    );
              } else {
                showErrorSnackBar(
                  context: context,
                  message: "لم يتم التعرف على الكود",
                );
              }
            }
          },
        );
      },
    );
  }
}

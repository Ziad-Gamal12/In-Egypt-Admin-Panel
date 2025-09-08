import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/bookings_cubit/bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsBottomSheet.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/QrCodeScannerPage.dart';

class CustomBookingsSearchAndFilterWidget extends StatefulWidget {
  const CustomBookingsSearchAndFilterWidget({
    super.key,
    required this.onBookingsChanged,
  });
  final ValueChanged<List<BookingEntity>> onBookingsChanged;

  @override
  State<CustomBookingsSearchAndFilterWidget> createState() =>
      _CustomBookingsSearchAndFilterWidgetState();
}

class _CustomBookingsSearchAndFilterWidgetState
    extends State<CustomBookingsSearchAndFilterWidget> {
  late TextEditingController controller;
  Timer? debouncer;
  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      debounce(isPaginated: false);
    });

    super.initState();
  }

  debounce({required bool isPaginated}) {
    if (debouncer != null && debouncer!.isActive) debouncer!.cancel();
    debouncer = Timer(const Duration(milliseconds: 500), () {
      context.read<BookingsCubit>().getSearchedBookings(
        searchKey: controller.text.trim().toLowerCase(),
        isPaginated: isPaginated,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 17,
          child: CustomSearchTextField(controller: controller),
        ),
        SizedBox(width: 20),
        FittedBox(
          child: IconButton(
            iconSize: 30,
            onPressed: () {
              GoRouter.of(context).push(QRScannerPage.routeName);
            },
            icon: Icon(FontAwesomeIcons.qrcode, color: Colors.black),
          ),
        ),
        SizedBox(width: 10),

        FittedBox(
          child: IconButton(
            iconSize: 30,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                backgroundColor: Colors.white,
                builder: (context) {
                  return FilterBookingsBottomSheet(
                    onBookingsChanged: widget.onBookingsChanged,
                  );
                },
              );
            },
            icon: Icon(FontAwesomeIcons.barsStaggered, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/bookings_cubit/bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsBottomSheet.dart';

class CustomBookingsSearchAndFilterWidget extends StatefulWidget {
  const CustomBookingsSearchAndFilterWidget({
    super.key,
    required this.searchKeyWord,
    required this.isSearching,
    required this.onBookingsChanged,
  });
  final ValueChanged<String> searchKeyWord;
  final ValueChanged<bool> isSearching;
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
      if (controller.text.isNotEmpty) {
        widget.searchKeyWord(controller.text.trim().toLowerCase());
        widget.isSearching(true);
        debounce(isPaginated: false);
      } else {
        widget.searchKeyWord("");
        widget.isSearching(false);
      }
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
              showBottomSheet(
                context: context,
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

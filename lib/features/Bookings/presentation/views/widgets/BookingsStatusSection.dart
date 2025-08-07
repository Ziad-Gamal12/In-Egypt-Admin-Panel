import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/BookingStatusEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsStatusListView.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsStatusSectionSelectStatusButton.dart';

class BookingsStatusSection extends StatefulWidget {
  BookingsStatusSection({
    super.key,
    required this.onStatusSelected,
    this.bookingstatusentity,
  });
  final ValueChanged<BookingStatusEntity> onStatusSelected;
  BookingStatusEntity? bookingstatusentity;
  @override
  State<BookingsStatusSection> createState() => _BookingsStatusSectionState();
}

class _BookingsStatusSectionState extends State<BookingsStatusSection> {
  BookingStatusEntity? bookingstatusentity;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.bookingstatusentity != null) {
        setState(() {
          bookingstatusentity = widget.bookingstatusentity;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      barrierColor: Colors.transparent,
      position: PopupPosition.top,
      arrowColor: Colors.black,
      contentDecoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: FilterBookingsStatusListView(
          onStatusSelected: (val) {
            Navigator.pop(context);
            setState(() {
              bookingstatusentity = val;
            });
            widget.onStatusSelected(val);
          },
        ),
      ),
      child: FilterBookingsStatusSectionSelectStatusButton(
        bookingStatusEntity: bookingstatusentity,
      ),
    );
  }
}

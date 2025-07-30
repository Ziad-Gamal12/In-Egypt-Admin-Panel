import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/BookingStatusEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsStatusListViewItem.dart';

class FilterBookingsStatusListView extends StatelessWidget {
  const FilterBookingsStatusListView({
    super.key,
    required this.onStatusSelected,
  });
  final ValueChanged<BookingStatusEntity> onStatusSelected;
  @override
  Widget build(BuildContext context) {
    List<BookingStatusEntity> statuses = BookingStatusEntity.statusOptions();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: statuses.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: () => onStatusSelected(statuses[index]),
          child: FilterBookingsStatusListViewItem(status: statuses[index]),
        ),
      ),
    );
  }
}

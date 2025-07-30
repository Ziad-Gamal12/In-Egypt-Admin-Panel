import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomFillterPlacesHeader.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomTeaxtField.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/CustomFilterBookingSortingRadioButtons.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/CustomFilterBookingsStartAndEndDatesRow.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/FilterBookingsBottomSheetWidgets/FilterBookingsStatusSection.dart';

class FilterBookingsBottomSheetBody extends StatelessWidget {
  const FilterBookingsBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFillterAndSortHeader(),
            const SizedBox(height: 20),
            FilterBookingsStatusSection(),
            SizedBox(height: 20),
            Customteaxtfield(
              labelText: "الرقم التعريفى ",
              obscureText: false,
              textInputType: TextInputType.text,
              validator: (val) {
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomFilterBookingsStartAndEndDatesRow(),
            SizedBox(height: 20),
            CustomFilterBookingSortingRadioButtons(),
          ],
        ),
      ),
    );
  }
}

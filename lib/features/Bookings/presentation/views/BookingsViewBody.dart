import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomSearchAndFilterWidget.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/CustomBookingsHeader.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/CustomBookingsSliverGrid.dart';

class BookingsViewBody extends StatelessWidget {
  const BookingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchAndFilterWidget(),
                  SizedBox(height: 20),
                  CustomBookingsHeader(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            CustomBookingsSliverGrid(maxWidth: constraints.maxWidth),
          ],
        ),
      ),
    );
  }
}

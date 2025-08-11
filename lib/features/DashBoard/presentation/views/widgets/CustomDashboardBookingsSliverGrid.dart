import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingItem.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/EmptyWidget.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingDetailsBottomSheetWidgets/BookingDetailsBottomSheet.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';

class CustomDashboardBookingsSliverGrid extends StatefulWidget {
  const CustomDashboardBookingsSliverGrid({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<CustomDashboardBookingsSliverGrid> createState() =>
      _CustomDashboardBookingsSliverGridState();
}

class _CustomDashboardBookingsSliverGridState
    extends State<CustomDashboardBookingsSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) {
        return current is DashboardGetDashBoardBookingsSuccess ||
            current is DashboardGetDashBoardBookingsLoading ||
            current is DashboardGetDashBoardBookingsFailure;
      },
      builder: (context, state) {
        if (state is DashboardGetDashBoardBookingsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(message: state.errmessage),
          );
        } else if (state is DashboardGetDashBoardBookingsSuccess &&
            state.response.bookings.isEmpty) {
          return SliverToBoxAdapter(child: Center(child: EmptyWidget()));
        } else if (state is DashboardGetDashBoardBookingsSuccess &&
            state.response.bookings.isNotEmpty) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
                onTap: () => showBookingDetails(
                  context,
                  index,
                  booking: state.response.bookings[index],
                ),
                child: CustomBookingItem(
                  booking: state.response.bookings[index],
                ),
              ),
              childCount: state.response.bookings.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: getItemAspectRatio(widget.maxWidth),
              crossAxisCount: getCrossAxisCount(widget.maxWidth),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      },
    );
  }

  void showBookingDetails(
    BuildContext context,
    int index, {
    required BookingEntity booking,
  }) {
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
      builder: (_) => BookingDetailsBottomSheet(bookingEntity: booking),
    );
  }

  double getItemAspectRatio(double maxWidth) {
    int crossAxisCount = getCrossAxisCount(maxWidth);
    double spacing = 20;
    double totalSpacing = spacing * (crossAxisCount - 1);
    double itemWidth = (maxWidth - totalSpacing) / crossAxisCount;

    double itemHeight = itemWidth * getAspectRatioHightprecentage(maxWidth);
    return itemWidth / itemHeight;
  }

  double getAspectRatioHightprecentage(double maxWidth) {
    if (maxWidth >= 600) return 1.50;
    return 1.51;
  }

  int getCrossAxisCount(double maxWidth) {
    if (maxWidth >= 1200) return 5;
    if (maxWidth >= 900) return 4;
    if (maxWidth >= 600) return 3;
    if (maxWidth >= 400) return 2;

    return 1; // For phones
  }
}

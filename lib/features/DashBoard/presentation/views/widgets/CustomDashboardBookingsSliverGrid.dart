import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/BookingWidgets/CustomBookingItem.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomDashboardBookingsSliverGrid extends StatelessWidget {
  const CustomDashboardBookingsSliverGrid({
    super.key,
    required this.maxWidth,
    required this.bookings,
  });
  final double maxWidth;
  final List<BookingEntity> bookings;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<DashboardCubit, DashboardState, bool>(
      selector: (state) {
        if (state is DashboardGetDashBoardBookingsLoading) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: getItemAspectRatio(maxWidth),
            crossAxisCount: getCrossAxisCount(maxWidth),
          ),
          itemCount: bookings.length,
          itemBuilder: (context, index) => Skeletonizer(
            enabled: state,
            child: CustomBookingItem(booking: bookings[index]),
          ),
        );
      },
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

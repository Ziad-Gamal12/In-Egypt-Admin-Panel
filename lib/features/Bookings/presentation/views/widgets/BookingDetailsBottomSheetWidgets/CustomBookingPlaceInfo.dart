import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignItem.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';

class CustomBookingPlaceInfo extends StatelessWidget {
  const CustomBookingPlaceInfo({super.key, required this.bookingEntity});

  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "المكان",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 10),
        CustomScaleAnimatedWidget(
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                useRootNavigator: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                builder: (_) {
                  return PlaceDetailsViewBody(place: bookingEntity.place);
                },
              );
            },
            child: CustomPlaceHorizintalDesignItem(place: bookingEntity.place),
          ),
        ),
      ],
    );
  }
}

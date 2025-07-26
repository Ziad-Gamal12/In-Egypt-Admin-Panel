import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/CustomFlutterMap.dart';

class CustomPlaceMap extends StatelessWidget {
  const CustomPlaceMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kMainColor, width: 1),
      ),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CustomFlutterMap(latitude: latitude, longitude: longitude),
        ),
      ),
    );
  }
}

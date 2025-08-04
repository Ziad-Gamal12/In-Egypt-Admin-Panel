import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';

class DashboardItemInfoTrendIcon extends StatelessWidget {
  const DashboardItemInfoTrendIcon({super.key, required this.trend});
  final String trend;

  @override
  Widget build(BuildContext context) {
    String asset;
    switch (trend) {
      case "up":
        asset = Assets.assetsIconsIncreasingArrow;
        break;
      case "down":
        asset = Assets.assetsIconsDecreasingArrow;
        break;
      case "equal":
        asset = Assets.assetsIconsEqual;
        break;
      default:
        asset = Assets.assetsIconsError;
    }

    return Image.asset(asset, fit: BoxFit.fill);
  }
}

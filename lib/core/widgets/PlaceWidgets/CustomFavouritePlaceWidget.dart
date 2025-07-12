import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:svg_flutter/svg.dart';

class CustomFavouritePlaceWidget extends StatelessWidget {
  const CustomFavouritePlaceWidget({super.key, required this.isFavourite});

  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: SvgPicture.asset(
        isFavourite
            ? Assets.assetsIconsFavouriteIcon
            : Assets.assetsIconsSolidfavouriteIcon,
      ),
    );
  }
}

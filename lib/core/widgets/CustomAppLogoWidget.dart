import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppLogoWidget extends StatelessWidget {
  const CustomAppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: SvgPicture.asset(Assets.assetsImagesAppLogo),
    );
  }
}

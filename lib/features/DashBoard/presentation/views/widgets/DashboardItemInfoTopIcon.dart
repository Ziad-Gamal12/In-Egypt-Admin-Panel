import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class DashboardItemInfoTopIcon extends StatelessWidget {
  const DashboardItemInfoTopIcon({super.key, required this.iconPath});
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          iconPath,
          height: 40,
          width: 40,
          color: Colors.amber,
        ),
      ),
    );
  }
}

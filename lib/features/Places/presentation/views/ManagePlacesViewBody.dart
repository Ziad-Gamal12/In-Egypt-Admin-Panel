import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/ManagePlacesViewBodyContent.dart';

class ManagePlacesViewBody extends StatefulWidget {
  const ManagePlacesViewBody({super.key});

  @override
  State<ManagePlacesViewBody> createState() => _ManagePlacesViewBodyState();
}

class _ManagePlacesViewBodyState extends State<ManagePlacesViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: ManagePlacesViewBodyContent(),
    );
  }
}

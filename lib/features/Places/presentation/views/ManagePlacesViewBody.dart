import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/ManagePlacesViewBodyContent.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';

class ManagePlacesViewBody extends StatefulWidget {
  const ManagePlacesViewBody({super.key});

  @override
  State<ManagePlacesViewBody> createState() => _ManagePlacesViewBodyState();
}

class _ManagePlacesViewBodyState extends State<ManagePlacesViewBody> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ManagePlacesViewBodyContent(
              onSelected: (value) {
                setState(() {
                  isSelected = value;
                });
              },
            ),
          ),
          if (isSelected)
            Expanded(flex: 4, child: PlaceDetailsViewBody())
          else
            SizedBox(),
        ],
      ),
    );
  }
}

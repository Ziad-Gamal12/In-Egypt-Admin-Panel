import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/AddPlaceBody.dart';

class CustomAddPlaceButton extends StatelessWidget {
  const CustomAddPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (_) {
            return AddPlaceBody();
          },
        );
      },
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: 35,
        child: FittedBox(child: Icon(Icons.add, color: kMainColor)),
      ),
    );
  }
}
